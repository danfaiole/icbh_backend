class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!
  skip_after_action :save_last_action_and_controller_name
end