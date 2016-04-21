class Employee < ActiveRecord::Base

	has_many :employee_groups
	has_many :comision_odts
	has_many :odts, through: :comision_odts
	has_many :auth_groups, through: :employee_groups

	def has_auth_to(action)
		self.auth_groups.each do |group|
			case group[action]
			when true
				return true 
			when false
				return false
			when nil
				return 'Action '+action.to_s+' not found'
			else
				return 'Not boolean'
			end
		end
	end

end