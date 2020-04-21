class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email.downcase])

		if @user&.authenticate(params[:session][:password])
			log_in @user
			redirect_to posts_path
		else
			flash.now[:danger] = "mot de passe ou e-mail invalide"
			render :new
		end
	end

	def destroy
		session.delete(:user_id) if logged_in?
		redirect_to posts_path
	end
end
