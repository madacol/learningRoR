class Gg < ActiveRecord::Base
	has_many :pools, as: :category
end
