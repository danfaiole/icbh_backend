class Users::SessionsController < Devise::SessionsController
  after_action :count_events, only: [:create]
end
