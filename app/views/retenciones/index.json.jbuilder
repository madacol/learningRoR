json.array!(@retenciones) do |retencione|
  json.extract! retencione, :id, :name, :razon_social_id, :tipo, :monto, :description, :status
  json.url retencione_url(retencione, format: :json)
end
