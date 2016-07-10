class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	  protect_from_forgery with: :exception
	  helper_method :current_user, :admin
	  @last = request.headers["HTTP_REFERER"]

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def admin

	  if((current_user)&&(current_user.role=="a")) then true
	  end
	end
end