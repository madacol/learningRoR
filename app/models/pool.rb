class Pool < ActiveRecord::Base  
	belongs_to :category, polymorphic: true
	has_one :permission_request, as: :auth_record, :dependent => :destroy
	belongs_to :razon_social
  	enum comprobante_type: [ "Recibo", "Factura", "Comprobante" ]
  	
	def table_name_to_show
		'Caja chica'
	end
	def record_name_to_show
		return self.description
	end
end
