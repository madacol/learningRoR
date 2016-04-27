class Inversion < ActiveRecord::Base
	has_many :pools, as: :category

	def table_name_to_show
		'Inversion'
	end
	def record_name_to_show
		return self.alias
	end
end
