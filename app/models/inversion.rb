class Inversion < ActiveRecord::Base
	has_many :pools, as: :category
end
