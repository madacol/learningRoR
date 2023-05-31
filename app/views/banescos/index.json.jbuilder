json.array!(@banescos) do |banesco|
  json.extract! banesco, :id
  json.url banesco_url(banesco, format: :json)
end
