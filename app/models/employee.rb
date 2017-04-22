class Employee < ActiveRecord::Base 
	validates_presence_of :name, presence: true, :message => "no puede estar vacío"
	validates_presence_of :cedula, presence: true, :message => "no puede estar vacío"
	validates_presence_of  :last_name, presence: true, :message => "no puede estar vacío"
	validates_presence_of  :email, presence: true, :message => "no puede estar vacío"

	has_many :comision_odts
	has_many :odts, through: :comision_odts
	has_many :pools, as: :category
	has_one :user

	def has_auth_to(action)
		self.auth_groups.each do |group|
			case group[action]
			when true
				return true 
			when false
				return false
			when nil
				return 'Action "'+action.to_s+'" not found'
			else
				return 'Not boolean'
			end
		end
	end

  def get_loan_balance
    montos = self.pools.collect do |x|
      p x.monto
    end
    balance = montos.sum
    self.loan_balance = balance
  end

	def description
		return "Préstamo de #{self.record_name_to_show}"
	end
	def category_name_to_show
	'Préstamo'
	end
	def table_name_to_show
		'Empleado'
	end
	def record_name_to_show
		return self.name+' '+self.last_name
	end	
end