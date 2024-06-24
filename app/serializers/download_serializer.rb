# == Schema Information
#
# Table name: downloads
#
#  id                    :integer          not null, primary key
#  title                 :string
#  description           :string
#  document_file_name    :string
#  document_content_type :string
#  document_file_size    :integer
#  document_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class DownloadSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :document

  def document
    ApplicationController.helpers.asset_url(
      object.document.url
    ) if object.document.present?
  end
end
