class AuthGroup < ActiveRecord::Base
	has_and_belongs_to_many :users


	def table_name_to_show
		'Grupo de Autorizacion'
	end
	def record_name_to_show
		return self.name
	end
end
