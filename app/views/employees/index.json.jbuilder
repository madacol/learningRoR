json.array!(@employees) do |employee|
  json.extract! employee, :id, :cedula, :name, :last_name, :phone_number, :email, :address, :startdate, :note
  json.url employee_url(employee, format: :json)
end
