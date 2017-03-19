class Inversion < ActiveRecord::Base
	has_many :pools, as: :category
	
	def category_name_to_show
		return self.table_name_to_show
	end
	def table_name_to_show
		'Inversion'
	end
	def record_name_to_show
		return "#{self.code} #{self.alias}"
	end
end
