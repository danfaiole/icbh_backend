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

class Form < ApplicationRecord
  attr_writer :skip_callback

  has_many :form_data, class_name: 'FormData'

  accepts_nested_attributes_for :form_data

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :only_one_active_form, on: :create
  validate :only_one_active_form_update, on: :update

  after_save :update_app_status, unless: :skip_callback

  def skip_callback
    @skip_callback ||= false
  end

  private

  def only_one_active_form
    if active
      errors.add(
        :active,
        "Só é permitido um formulário ativo por vez."
      ) if self.class.where(active: true).count != 0
    end
  end

  def only_one_active_form_update
    if active && self.class.find_by(active: true).present? && self.class.find_by(active: true).try(:id) != id
      errors.add(
        :active,
        "Só é permitido um formulário ativo por vez."
      )
    end
  end

  ##
  # Overwrite of the method in the application record
  def update_app_status
    has_form = self.class.where(active: true).present?
    last_status = AppStatus.last

    # Build the params hash
    params = {
      last_news: last_status.present? ? last_status.last_news : nil,
      last_event: last_status.present? ? last_status.last_event : nil,
      last_download: last_status.present? ? last_status.last_download : nil,
      form_avaliable: has_form
    }

    AppStatus.create(params)
  end
end
