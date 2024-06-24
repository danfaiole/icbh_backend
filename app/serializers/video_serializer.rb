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

class VideoSerializer < ActiveModel::Serializer
  attributes :id, :url, :thumbnail, :title, :description,
    :publication_date

  def thumbnail
    ApplicationController.helpers.asset_url(
      object.thumbnail.url
    ) if object.thumbnail.present?
  end
end
