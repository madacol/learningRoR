class Retencione < ActiveRecord::Base
	belongs_to :razon_social
	has_many :pools, as: :category
	has_many :bdvs, as: :category
	has_many :bods, as: :category
	has_many :mercantils, as: :category
	has_many :banescos, as: :category
	has_many :provincials, as: :category
	enum tipo: [ "Recibo", "Factura", "Comprobante" ]
	enum status: [ "Recibido", "En proceso", "Pagado" ]
	def category_name_to_show
		return self.table_name_to_show
	end
	def table_name_to_show
		'Retencion'
	end
	def record_name_to_show
		return self.code_factura
	end
end

