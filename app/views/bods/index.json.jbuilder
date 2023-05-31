json.array!(@bods) do |bod|
  json.extract! bod, :id
  json.url bod_url(bod, format: :json)
end
