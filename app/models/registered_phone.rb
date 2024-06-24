# == Schema Information
#
# Table name: registered_phones
#
#  id         :integer          not null, primary key
#  phone_id   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RegisteredPhone < ApplicationRecord
  validates :phone_id, presence: true, uniqueness: true
end
