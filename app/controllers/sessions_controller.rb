class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(:params[:session][:email])
		if user && user.authenticate(:params[:session][:password])
			visit_page(user_path(user))
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
	end

end
