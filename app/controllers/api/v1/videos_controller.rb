class API::V1::VideosController < ApiController
  def index
    @videos = Video.where(published: true)
              .order(publication_date: :desc)

    render json: @videos
  end
end