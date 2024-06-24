class API::V1::AppStatusController < ApiController
  def index
    @app_status = AppStatus.last

    render json: @app_status
  end
end