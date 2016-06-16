class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	belongs_to :employee

	after_create :send_welcome_email
	
	def table_name_to_show
		'Usuarios'
	end
	def record_name_to_show
		return self.employee.record_name_to_show
	end
	
	private

	def send_welcome_email
		ApplicationMailer.welcome_email(self).deliver
	end
  
end
