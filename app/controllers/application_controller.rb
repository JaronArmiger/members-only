class ApplicationController < ActionController::Base
	include SessionsHelper
	
	def require_login
		flash.now[:alert] = "vous devez etre connecte pour voir cette page!"
		redirect_to posts_path if current_user.nil?
	end
end
