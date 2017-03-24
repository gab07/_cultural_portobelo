class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_quotation

  def current_quotation
    if !session[:quotation_id].nil?
      Quotation.find(session[:quotation_id])
    else
      Quotation.new
    end
  end

  protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:password, :email) }
     devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:password, :email) }
   end
end
