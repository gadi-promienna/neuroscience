json.array!(@news) do |news|
  json.extract! news, :id, :date, :title, :type, :content, :author_id, :graphic_id
  json.url news_url(news, format: :json)
end
