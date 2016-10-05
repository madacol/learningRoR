class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable,
				 :rememberable, :trackable, :validatable

	belongs_to :employee
	has_and_belongs_to_many :auth_groups

	after_create :send_welcome_email
	
	def table_name_to_show
		'Usuarios'
	end
	def record_name_to_show
		return self.employee.record_name_to_show
	end

	def can(action)
		self.auth_groups.each do |group|
			if group.can action
				return true
			end
		end
		return false
	end
	def cannot(action)
		not self.can action
	end
	
	private
		def send_welcome_email
			UserMailer.welcome_email(self).deliver
		end
end
