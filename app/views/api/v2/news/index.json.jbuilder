json.array! @news do |news|
  json.id news.id
  json.title news.title
  json.body news.body
  json.title_image asset_url(news.title_image.url)
  json.publication_date news.publication_date
end