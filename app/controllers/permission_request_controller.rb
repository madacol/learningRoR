class PermissionRequestController < ApplicationController
	before_action :is_token_missing?, only: [:approve, :deny]
	before_action :set_token_record, only: [:approve, :deny]
	before_action :set_auth_record, only: [:approve, :deny]
	before_action :is_already_approved_or_denied?, only: [:approve, :deny]

	# GET /approve/:token
	def approve
		@permission_request.action.starts_with?('destroy') ? YAML.load(@permission_request.auth_record_object).destroy : YAML.load(@permission_request.auth_record_object).save
		@permission_request.auth_record = YAML.load(@permission_request.auth_record_object) if @permission_request.action.starts_with?('create')
		@permission_request.is_pending = false
		@permission_request.approved_at = Time.now
	end

	# GET /deny/:token
	def deny
		 @permission_request.destroy
	end

	# POST /set_permission
	def set_permission
		permission_request_params = params.require(:permission).permit(:id, :user_id)
		@user = User.find permission_request_params[:user_id]
		@permission_request = PermissionRequest.find permission_request_params[:id]
		@permission_request.is_pending = true
		@permission_request.auth_record = YAML.load(@permission_request.auth_record_object) unless @permission_request.action.starts_with?('create')		
		puts '','#########################',@user.email,'#########################',''
		puts '','#########################',@permission_request.auth_record_object,'#########################',''
		UserMailer.send_request_to_approve(@user, @permission_request).deliver_now
		redirect_to root_url
	end

	# GET /ask
	def ask
		# @yamled_record_to_approve and @action should be previously defined on other's controller through the application_controller
		unless defined? flash[:yamled_record_to_approve] and defined? flash[:action] and not flash[:yamled_record_to_approve].nil? and not flash[:action].nil?
			redirect_to root_url, :status => :not_found and return
		end		
		puts '','#########################',YAML.load(flash[:yamled_record_to_approve]),'#########################',''
		@permission_request = PermissionRequest.new
		@permission_request.auth_record_object = flash[:yamled_record_to_approve]
		@permission_request.action = flash[:action]
		flash[:yamled_record_to_approve] = nil
		flash[:action] = nil
		@permission_request.token = SecureRandom.urlsafe_base64
		@permission_request.save
		@authorized_users = get_users_who_can? @permission_request.action
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_token_record
			@permission_request = PermissionRequest.where(token: params[:token]).first
		end
		def set_auth_record
			@auth_record = @permission_request.auth_record
		end			
		def is_token_missing?
			if @permission_request.nil?
				render :file => "public/404.html", alert: 'Token no existe' and return
			end
		end
		def is_already_approved_or_denied?
			unless @permission_request.is_pending
				render :file => "public/404.html", alert: 'Ya fue aprobado', date: @permission_request.approved_at and return
			end
		end
		def get_users_who_can?(action)
			return User.all.select { |user| user.can(action) }
		end
end
