class Retencione < ActiveRecord::Base
  belongs_to :razon_social
  has_many :pools, as: :category

	def table_name_to_show
		'Retencion'
	end
	def record_name_to_show
		return self.code_factura
	end
end
