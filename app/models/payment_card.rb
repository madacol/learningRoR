class PaymentCard < ActiveRecord::Base
	enum bank: [ "Banesco", "Bdv", "Bod", "Mercantil", "Provincial" ]
	enum card_type: [ "Debito", "Visa", "Master", "Amex" ]
	enum status: [ "Activa", "Inactiva" ]

	def table_name_to_show
		'Tarjetas bancarias'
	end
	def card_name_to_show
		return "#{self.card_type} #{self.last_digits}"
	end
	def transactions
		if self.bank.nil?
			puts '',"Warning: This should never happen, there's no bank attr",''
			return []
		end
		forma_de_pago_enum_id = eval(self.bank).forma_de_pagos["#{self.id}"]
		if forma_de_pago_enum_id.nil?
			puts '',"Warning: forma_de_pago's enum is not configured on #{self.bank}",''
			return []
		end
		eval(self.bank).where(forma_de_pago: forma_de_pago_enum_id)
	end
	def is_banks_last_card?
		self == PaymentCard.where(bank: self.bank).last
	end
end