class Inversion < ActiveRecord::Base
	has_many :pools, as: :category
	has_many :bdvs, as: :category
	has_many :bods, as: :category
	has_many :banescos, as: :category
	has_many :mercantils, as: :category
	has_many :provincials, as: :category


	def table_name_to_show
		'Inversion'
	end
	def record_name_to_show
		return self.alias
	end
end
