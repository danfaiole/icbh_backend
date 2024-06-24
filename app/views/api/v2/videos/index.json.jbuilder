json.array! @videos do |video|
  json.id video.id
  json.title video.title
  json.url video.url
  json.thumbnail video.thumbnail
end