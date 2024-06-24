# == Schema Information
#
# Table name: forms
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  help_text  :string
#  active     :boolean          default(FALSE), not null
#  fields     :jsonb
#  start_date :date             not null
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FormSerializer < ActiveModel::Serializer
  attributes :id, :title, :help_text, :fields, :start_date, :end_date
end
