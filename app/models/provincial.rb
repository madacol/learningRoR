class Provincial < ActiveRecord::Base
	belongs_to :category, polymorphic: true
	has_one :permission_request, as: :auth_record, :dependent => :destroy
	belongs_to :razon_social
	bank_name = 'Provincial'
	cards = PaymentCard.where(bank: PaymentCard.banks[bank_name]).collect {|card| "#{card.id}"}
	enum forma_de_pago: [ "Efectivo", "Cheque", "Transferencia" ] + cards

	#Substitute card's ids in forma_de_pago, with card_name_to_show
	def forma_de_pagos_for_collection
		array = self.class.forma_de_pagos.collect do |k,v|
			if is_integer?(k)
				[k, PaymentCard.find(k).card_name_to_show]
			else
				[k,k]
			end
		end
		Hash[array]
	end
	def table_name_to_show
		'Provincial'
	end
	def record_name_to_show
		return self.description
	end

	private
	def is_integer?(string)
		string.to_i.to_s == string
	end
end