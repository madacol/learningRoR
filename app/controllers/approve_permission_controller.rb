class ApprovePermissionController < ApplicationController
	before_action :set_token_record
	before_action :is_token_missing?
	before_action :is_already_approved?
	before_action :set_auth_record

  # GET /approve/:token
	def approve
		@token_record.is_pending = false
		@token_record.approved_at = Time.now
		@token_record.save
	end

  # GET /deny/:token
	def deny
		@auth_record.destroy
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_token_record
			@token_record = PermissionRequest.where(token: params[:token]).first
    end
    def is_token_missing?
			if @token_record.nil?
				render :file => "public/404.html", alert: 'Token no existe' and return
			end
    end
    def is_already_approved?
    	permission_denied and return unless @token_record.is_pending
    	unless @token_record.is_pending
    		render :file => "public/404.html", alert: 'Ya fue aprobado', date: @token_record.approved_at and return
    	end
    end
    def set_auth_record
    	@auth_record = @token_record.auth_record
		end
end