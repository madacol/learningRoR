json.array!(@blahs) do |blah|
  json.extract! blah, :id, :name
  json.url blah_url(blah, format: :json)
end
