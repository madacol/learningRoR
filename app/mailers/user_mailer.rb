class UserMailer < ApplicationMailer
	def welcome_email(user)
		@user = user
		@url  = 'http://example.com/login'
		mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	end
	def send_request_to_approve(user, permission_request)
		#@user = user
		@token = permission_request.token
		@attributes = permission_request.auth_record_object['attributes']
		@model = eval(permission_request.auth_record_object['model']).take.table_name_to_show
		@action = translate_action(permission_request.action)
		mail(to: 'madacol10@gmail.com', subject: 'Se necesita aprobacion')
	end

	private
		def translate_action(action)
			case action.split('_',2).first
			when 'create'
				'Crear'
			when 'update'
				'Modificar'
			when 'destroy'
				'Eliminar'
			when ''
				'MAKES NO SENSE AT ALLLLL'
			else
				action
			end
		end
end