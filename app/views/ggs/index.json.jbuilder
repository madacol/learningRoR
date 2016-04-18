json.array!(@ggs) do |gg|
  json.extract! gg, :id, :code, :description
  json.url gg_url(gg, format: :json)
end
