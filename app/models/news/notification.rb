# == Schema Information
#
# Table name: news_notifications
#
#  id              :integer          not null, primary key
#  news_id         :integer
#  delayed_jobs_id :integer
#  date            :datetime
#  title           :string
#  body            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class News::Notification < Notification
  APP_SCREEN_TITLE = 'NewsDetailsPage'

  belongs_to :news

  validates :date, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
