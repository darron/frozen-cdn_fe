class ApplicationController < ActionController::Base
  protect_from_forgery
	before_filter :set_user_time_zone
  before_filter :check_user_confirmation_status

	def set_user_time_zone
	  Time.zone = current_user.time_zone if user_signed_in?
	end

  def check_user_confirmation_status
    flash[:notice] = "Please confirm your account by clicking the link in the email we sent to #{current_user.email}" if user_signed_in? && !current_user.confirmed?
  end

  private
  def after_sign_out_path_for(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    send(:"new_#{scope}_session_path")
  end
end
