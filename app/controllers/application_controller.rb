class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_permitted_parameters, if: :devise_controller?

  def ask_for_permission(auth_record, action)
    flash[:hashed_record_to_approve] = { "model" => auth_record.model_name.name, "attributes" => auth_record.attributes }
    flash[:action] = action
    redirect_to ask_permission_url
  end

  def permission_denied
    redirect_to root_url, :notice => "No está autorizado"
  end

  def update_balances(pool)
    previous_record = eval(pool.model_name.name).where("id < #{pool.id}").last
    (previous_record.nil? or previous_record.balance.nil?) ?
      last_balance = 0 : last_balance = previous_record.balance
    return eval(pool.model_name.name).where("id >= #{pool.id}").collect do |g|
      g.balance = g.monto + last_balance
      last_balance = g.balance
      g.save
    end
  end

  protected

  def configure_devise_permitted_parameters
    permitted_params = [ :employee_id, :email, :password, :password_confirmation, :unit_prefs]

    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update) { 
        |u| u.permit(permitted_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) { 
        |u| u.permit(permitted_params) 
      }
    end
  end
end
