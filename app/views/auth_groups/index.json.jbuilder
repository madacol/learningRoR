json.array!(@auth_groups) do |auth_group|
  json.extract! auth_group, :id, :name
  json.url auth_group_url(auth_group, format: :json)
end
