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

class Event < ApplicationRecord
  has_many :event_notifications, class_name: 'EventNotification', dependent: :destroy

  accepts_nested_attributes_for :event_notifications, allow_destroy: true

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :title, presence: true
  validates :color, presence: true
  validate :validate_end_date

  before_validation :set_end_date
  # after_save :notify_users

  private

  ##
  # Set end_date == start_date if end_date is not set
  def set_end_date
    self.end_date = start_date unless end_date.present?
  end

  ##
  # Validates if end_date is bigger than the
  # start_date
  def validate_end_date
    return false unless end_date.present? && start_date.present?

    errors.add(
      :end_date, "A data de término não pode ser anterior a data de início do evento"
    ) if end_date < start_date
  end

  ##
  # Callback after save to notify users about new
  # event
  # def notify_users
  #   Rpush::Gcm::Notification.create(
  #     app: Rpush::Gcm::App.find_by(name: "icbh_android"),
  #     registration_ids: RegisteredPhone.pluck(:phone_id),
  #     data: { message: "Novo evento!" },
  #     priority: 'normal',
  #     content_available: true,
  #     notification: {
  #       body: "No dia #{start_date.strftime('%d-%m-%Y')} teremos um #{title} às #{start_date.strftime('%H:%M')}",
  #       title: 'Novo evento no calendário!'
  #     }
  #   )
  # end

end
