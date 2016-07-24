json.array!(@mercantils) do |mercantil|
  json.extract! mercantil, :id
  json.url mercantil_url(mercantil, format: :json)
end
