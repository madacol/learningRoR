json.extract! payment_card, :id, :bank_id, :bank_type, :type, :last_digits, :status, :created_at, :updated_at
json.url payment_card_url(payment_card, format: :json)