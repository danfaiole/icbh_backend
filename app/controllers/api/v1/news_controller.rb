class API::V1::NewsController < ApiController
  def index
    @news = News.where(published: true)
              .order(publication_date: :desc)

    render json: @news
  end

  def show
    @news = News.find_by(id: news_params[:id])

    render json: @news
  end

  private

  def news_params
    params.permit(:id)
  end
end