json.array!(@provincials) do |provincial|
  json.extract! provincial, :id
  json.url provincial_url(provincial, format: :json)
end
