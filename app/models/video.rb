# == Schema Information
#
# Table name: videos
#
#  id                     :integer          not null, primary key
#  url                    :string           not null
#  thumbnail_file_name    :string
#  thumbnail_content_type :string
#  thumbnail_file_size    :integer
#  thumbnail_updated_at   :datetime
#  title                  :string           not null
#  description            :string
#  published              :boolean          default(FALSE)
#  publication_date       :date
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Video < ApplicationRecord
  has_attached_file :thumbnail

  validates :url, presence: true
  validates :title, presence: true
  validates_attachment :thumbnail, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                        size: { less_than: 1.megabytes }

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
