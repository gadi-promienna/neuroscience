json.array!(@authors) do |author|
  json.extract! author, :id, :name, :surname, :mail
  json.url author_url(author, format: :json)
end
