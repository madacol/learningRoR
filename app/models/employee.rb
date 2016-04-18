class Employee < ActiveRecord::Base
	has_many :employee_groups
	has_many :comision_odts
	has_many :odts, through: :comision_odts
	has_many :auth_groups, through: :employee_groups
end