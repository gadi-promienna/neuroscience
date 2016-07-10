json.array!(@articles) do |article|
  json.extract! article, :id, :title, :article_topic_id, :content, :author_id, :graphic_id
  json.url article_url(article, format: :json)
end
