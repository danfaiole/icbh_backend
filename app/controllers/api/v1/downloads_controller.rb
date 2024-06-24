class API::V1::DownloadsController < ApiController
  def index
    @downloads = Download.all

    render json: @downloads
  end
end