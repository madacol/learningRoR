class IsAllowedTo < ActiveRecord::Base
	belongs_to :auth_group

	def table_name_to_show
		'Acciones'
	end
	def record_name_to_show
		return self.auth_group.record_name_to_show
	end
end
