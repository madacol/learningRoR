class AuthGroup < ActiveRecord::Base
	has_many :employee_groups
	has_many :employees, through: :employee_groups


	def table_name_to_show
		'Grupo de Autorizacion'
	end
	def record_name_to_show
		return self.name
	end
end
