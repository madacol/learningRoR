json.array!(@employee_groups) do |employee_group|
  json.extract! employee_group, :id, :employee_id, :auth_group_id
  json.url employee_group_url(employee_group, format: :json)
end
