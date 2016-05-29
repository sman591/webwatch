json.array!(@websites) do |website|
  json.extract! website, :id, :url
  json.url website_url(website, format: :json)
end
