json.extract! payment_method, :id, :account_id, :method, :status, :created_at, :updated_at
json.url payment_method_url(payment_method, format: :json)