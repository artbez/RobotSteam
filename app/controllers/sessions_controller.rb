class SessionsController < ApplicationController
	
	protect_from_forgery with: :exception
	include SessionsHelper
	
	def new
	end
	
	def create 
		user = User.find_by(login: params[:session][:login].downcase)
		if (user) && (params[:session][:password] == user.password)
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'Invalid login/password combination'
			render 'new'
		end
	end
	
	def destroy
		sign_out
		redirect_to root_url
	end
end
