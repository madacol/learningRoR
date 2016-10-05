class ComisionOdt < ActiveRecord::Base
	belongs_to :odt
	belongs_to :employee
	def table_name_to_show
		'Porcentaje de Comision'
	end
	def record_name_to_show
		return self.p_comision
	end
end
