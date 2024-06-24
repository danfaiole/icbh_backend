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

class NewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :body,
    :publication_date, :title_image,
    :author

  def title_image
    ApplicationController.helpers.asset_url(
      object.title_image.url
    ) if object.title_image.present?
  end

  def author
    object.user.name
  end
end
