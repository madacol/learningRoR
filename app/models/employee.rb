class Employee < ActiveRecord::Base 
	validates_presence_of :name, presence: true, :message => "no puede estar vacío"
	validates_presence_of :cedula, presence: true, :message => "no puede estar vacío"
	validates_presence_of  :last_name, presence: true, :message => "no puede estar vacío"
	validates_presence_of  :email, presence: true, :message => "no puede estar vacío"

	has_many :comision_odts
	has_many :odts, through: :comision_odts
	has_many :pools, as: :category
	has_many :bdvs, as: :category
	has_many :bods, as: :category
	has_many :banescos, as: :category
	has_many :mercantils, as: :category
	has_many :provincials, as: :category
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
	
    def table_name_to_show
    	'Empleado'
    end
	def record_name_to_show
		return self.name+' '+self.last_name
	end	

end