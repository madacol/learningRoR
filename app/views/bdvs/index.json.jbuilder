json.array!(@bdvs) do |bdv|
  json.extract! bdv, :id
  json.url bdv_url(bdv, format: :json)
end
