class Action < ActiveRecord::Base
	has_many :is_allowed_to, :dependent => :destroy
	
	def table_name_to_show
		'Acciones'
	end
	def record_name_to_show
		return self.name
	end
end
