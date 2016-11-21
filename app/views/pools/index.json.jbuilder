json.array!(@pools) do |pool|
  json.extract! pool, :id, :odt_id, :gg_id, :inversion_id, :loan_id, :retencione_id, :monto, :balance, :n_factura, :description
  json.url pool_url(pool, format: :json)
end
