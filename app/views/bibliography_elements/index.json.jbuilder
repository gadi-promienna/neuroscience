json.array!(@bibliography_elements) do |bibliography_element|
  json.extract! bibliography_element, :id, :friendly_name, :source, :description
  json.url bibliography_element_url(bibliography_element, format: :json)
end
