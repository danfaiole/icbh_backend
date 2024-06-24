# == Schema Information
#
# Table name: app_status
#
#  id             :integer          not null, primary key
#  last_news      :datetime
#  last_event     :datetime
#  last_download  :datetime
#  form_avaliable :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AppStatus < ApplicationRecord
end
