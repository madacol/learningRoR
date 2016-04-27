json.array!(@deducciones_odts) do |deducciones_odt|
  json.extract! deducciones_odt, :id, :od_id, :name, :p_gasto
  json.url deducciones_odt_url(deducciones_odt, format: :json)
end
