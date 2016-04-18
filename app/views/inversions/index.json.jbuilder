json.array!(@inversions) do |inversion|
  json.extract! inversion, :id, :code, :description
  json.url inversion_url(inversion, format: :json)
end
