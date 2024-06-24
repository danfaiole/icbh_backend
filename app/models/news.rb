# == Schema Information
#
# Table name: news
#
#  id                       :integer          not null, primary key
#  title                    :string           not null
#  body                     :text
#  title_image_file_name    :string
#  title_image_content_type :string
#  title_image_file_size    :integer
#  title_image_updated_at   :datetime
#  published                :boolean
#  publication_date         :date
#  user_id                  :integer          not null
#  tags                     :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class News < ApplicationRecord
  has_attached_file :title_image

  belongs_to :user
  has_many :news_notification, class_name: 'News::Notification'

  accepts_nested_attributes_for :news_notification, allow_destroy: true

  validates :title, presence: true
  validates :user, presence: true
  validates_attachment :title_image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                        size: { less_than: 2.megabytes }
  before_save :set_publication_date

  ##
  # Return if news is published or not as a string for
  # use in the views
  def published_status
    published ? 'Sim' : 'Não'
  end

  private

  ##
  # Set the publication date only when the user
  # sets published = true. So it can be different from the
  # creation date.
  def set_publication_date
    self.publication_date ||= Time.now if published
  end
end
