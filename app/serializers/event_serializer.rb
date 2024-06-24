# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  start_date  :datetime         not null
#  end_date    :datetime         not null
#  title       :string           not null
#  color       :string           default("blue"), not null
#  description :string
#  location    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class EventSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date,
    :title, :description, :location

  ##
  # Send the time in milliseconds
  def start_date
    object.start_date.to_datetime.strftime('%Q')
  end

  def end_date
    object.end_date.to_datetime.strftime('%Q')
  end
end
