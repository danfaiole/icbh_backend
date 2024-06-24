class API::V2::NewsController < ApiController
  def index
    @news = News.select(
      :id, :title, :body, :publication_date,
      :title_image_file_name, :title_image_content_type,
      :title_image_file_size, :title_image_updated_at
    )
    .where(published: true)
    .order(publication_date: :desc)

    render status: :ok
  end

  def show
    @news = News.select(:id, :title, :body, :title_image, :publication_date)
            .find_by(id: news_params[:id])

    render status: :ok
  end

  private

  def news_params
    params.permit(:id)
  end
end