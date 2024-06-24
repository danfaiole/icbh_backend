class Notification < ActiveRecord::Base
  self.abstract_class = true

  APP_SCREEN_TITLE = ''

  after_create :create_job
  after_destroy :delete_job

  def create_job
    delayed_job = ScheduleNotificationJob.delay(run_at: date)
                    .perform_now(
                      title: title.gsub('${', '#{'),
                      body: body.gsub('${', '#{')#,
                      #screen_title: self.class::APP_SCREEN_TITLE
                    )

    self.update(
      delayed_jobs_id: delayed_job.id
    )
  end

  ##
  # On delete, it remembers to destroy the job that is scheduled
  # to send the notification
  def delete_job
    self.class.connection.execute <<-SQL.squish
      delete from delayed_jobs
        where id = #{self.delayed_jobs_id}
    SQL
  end
end
