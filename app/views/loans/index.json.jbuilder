json.array!(@loans) do |loan|
  json.extract! loan, :id, :employee_id, :monto, :description, :balance
  json.url loan_url(loan, format: :json)
end
