# == Schema Information
#
# Table name: form_data
#
#  id         :integer          not null, primary key
#  form_id    :integer          not null
#  data       :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FormData < ApplicationRecord
  belongs_to :form

  validates :data, presence: true
end
