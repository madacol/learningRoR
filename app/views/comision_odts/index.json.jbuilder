json.array!(@comision_odts) do |comision_odt|
  json.extract! comision_odt, :id, :odt_id, :employee_id, :p_comision
  json.url comision_odt_url(comision_odt, format: :json)
end
