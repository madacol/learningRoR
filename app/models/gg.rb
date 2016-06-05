class Gg < ActiveRecord::Base
	has_many :pools, as: :category

	def table_name_to_show
		'Gastos Grls'
	end
	def record_name_to_show
		return self.code
	end
end
