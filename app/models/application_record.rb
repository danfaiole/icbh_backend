class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  after_save :update_app_status

  ##
  # Update the app status table everytime one of the
  # models that update the apk is updated
  def update_app_status
    if AppStatus.column_names.include?("last_#{self.class.name.downcase}")
      # Gets the last status
      last_status = AppStatus.last

      # Build the params hash
      params = {
        last_news: last_status.present? ? last_status.last_news : nil,
        last_event: last_status.present? ? last_status.last_event : nil,
        last_download: last_status.present? ? last_status.last_download : nil,
        form_avaliable: last_status.present? ? last_status.form_avaliable : nil
      }

      # Update only the column with the name of the model
      params["last_#{self.class.name.downcase}"] = Time.now

      AppStatus.create(params)
    end
  end
end
