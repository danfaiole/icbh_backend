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

class Download < ApplicationRecord
  has_attached_file :document
  validates_attachment :document, presence: true,
    content_type: { content_type: "application/pdf" }
end
