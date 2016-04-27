json.array!(@retenciones) do |retencione|
  json.extract! retencione, :id, :code_factura, :razon_social_id, :type, :monto, :description, :status
  json.url retencione_url(retencione, format: :json)
end
