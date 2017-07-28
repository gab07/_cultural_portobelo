class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  helper_method :current_quotation, :quotation_client

  def current_quotation
    if session[:quotation_id].nil?
      Quotation.new
    else
      Quotation.find(session[:quotation_id])
    end
  end

  def quotation_client(quotation)
    binding.pry
    client_name = Client.find(quotation.client_id).name
    client_ruc = Client.find(quotation.client_id).ruc
    client_dv = Client.find(quotation.client_id).dv
    return client_name, client_ruc, client_dv
  end

  protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:password, :email) }
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:password, :email) }
   end
end
