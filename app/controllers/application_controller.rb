class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_permitted_parameters, if: :devise_controller?

  def permission_denied
    render :file => "public/422.html", :status => :unauthorized
  end

  protected

  def configure_devise_permitted_parameters
    permitted_params = [ :employee_id, :email, :password, :password_confirmation, :unit_prefs]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(permitted_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(permitted_params) 
      }
    end
  end
end
