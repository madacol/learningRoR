class PermissionRequestController < ApplicationController
	before_action :set_token_record, only: [:approve, :deny]
	before_action :is_token_missing?, only: [:approve, :deny]
	before_action :is_already_approved_or_denied?, only: [:approve, :deny]
	before_action :is_hashed_defined?, only: [:ask]

	# GET /approve/:token
	def approve
		case @permission_request.action.split('_').first
		when 'create'
			model = @permission_request.auth_record_object['model']
			attributes = @permission_request.auth_record_object['attributes']
			@permission_request.auth_record = eval(model).create attributes
		when 'update'
			@permission_request.auth_record.update @permission_request.auth_record_object['attributes']
		when 'destroy'
			@permission_request.auth_record.destroy
		end
		@permission_request.is_pending = false
		@permission_request.approved_at = Time.now
		@permission_request.save
	end

	# GET /deny/:token
	def deny
		 @permission_request.destroy
	end

	# POST /set_permission
	def set_permission
		@permission_request = PermissionRequest.find params[:permission][:id]
		@user = User.find_by id: params[:permission][:user_id]

		redirect_to root_url, notice: 'Usuario no existe' and return if @user.nil?
		redirect_to root_url, notice: "ERROR\n#{@user.record_name_to_show} no está autorizado" and return if @user.cannot @permission_request.action

		@permission_request.is_pending = true
		unless @permission_request.action.starts_with?('create')
			@permission_request.auth_record_type = @permission_request.auth_record_object['model']
			@permission_request.auth_record_id = @permission_request.auth_record_object['attributes']['id']
		end
		@permission_request.save
		UserMailer.send_request_to_approve(@user, @permission_request).deliver_now
		redirect_to root_url
	end

	# GET /ask
	def ask		
		puts '','#########################',flash[:hashed_record_to_approve],'#########################',''
		@permission_request = PermissionRequest.new
		@permission_request.auth_record_object = flash[:hashed_record_to_approve]
		@permission_request.action = flash[:action]
		@permission_request.token = SecureRandom.urlsafe_base64
		@permission_request.save
		@authorized_users = get_users_who_can? @permission_request.action
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_token_record
			@permission_request = PermissionRequest.find_by token: params[:token]
		end
		def is_token_missing?
			if @permission_request.nil?
				redirect_to root_url, notice: 'Token no existe' and return
			end
		end
		def is_already_approved_or_denied?
			unless @permission_request.is_pending
				redirect_to root_url, notice: 'Ya fue aprobado', date: @permission_request.approved_at and return
			end
		end
		def get_users_who_can?(action)
			return User.all.select { |user| user.can(action) }
		end
		def is_hashed_defined?
			unless defined? flash[:hashed_record_to_approve] and defined? flash[:action] and not flash[:hashed_record_to_approve].nil? and not flash[:action].nil?
				redirect_to root_url, :status => :not_found and return
			end
		end
end
