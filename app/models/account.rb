class Account < ActiveRecord::Base
	has_many :pools
	has_many :cierres
end
