class EmployeeGroup < ActiveRecord::Base
  belongs_to :employee
  belongs_to :auth_group
end
