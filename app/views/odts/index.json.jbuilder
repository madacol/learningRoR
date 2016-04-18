json.array!(@odts) do |odt|
  json.extract! odt, :id, :code, :description, :razon_social_id_id, :monto_contrato
  json.url odt_url(odt, format: :json)
end
