json.array!(@razon_socials) do |razon_social|
  json.extract! razon_social, :id, :rif_ci, :name, :description, :phone, :email, :address, :contact_name, :contact_phone, :contact_email
  json.url razon_social_url(razon_social, format: :json)
end
