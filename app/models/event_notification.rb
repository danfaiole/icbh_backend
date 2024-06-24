# == Schema Information
#
# Table name: event_notifications
#
#  id              :integer          not null, primary key
#  event_id        :integer          not null
#  delayed_jobs_id :integer
#  date            :datetime         not null
#  title           :string           not null
#  body            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class EventNotification < Notification
  APP_SCREEN_TITLE = 'CalendarModalPage'

  belongs_to :event

  validates :date, presence: true
  validates :title, presence: true
  validates :body, presence: true

end
