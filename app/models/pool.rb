class Pool < ActiveRecord::Base  
	belongs_to :category, polymorphic: true 
	belongs_to :razon_social   

	def table_name_to_show
		'Pool'
	end
	def record_name_to_show
		return self.description
	end
end
