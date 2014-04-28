class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def show 
		@user = User.find(params[:id])
	end
	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			if (@user.id == 1)
				@user.userType = 'admin'
			else
				@user.userType = 'user'
			end
			@user.update(user_params)
			uploadPhoto(@user)
			redirect_to @user
		else
			render 'new'
		end
	end
	
	def orders
		@user = User.find(params[:id])
	end
	
	private
		def user_params
			params.require(:user).permit(:login, :password, :about, :photoPath)
		end
		def uploadPhoto(user)
			uploaded_io = params[:user][:photo]
			if uploaded_io == nil
				return
			else
				oldFilename = uploaded_io.original_filename
			end
			tempSplit = oldFilename.split('.')
			format = '.' + tempSplit[tempSplit.size - 1]
			newPhotoPath = Rails.root.join('app', 'assets', 'images', 'userphoto_' + user.id.to_s + format)
			
			File.open(newPhotoPath, 'wb')  do |file|
				file.write(uploaded_io.read)
			end
			
			user.photoPath = newPhotoPath.to_s
			user.update(user_params)
		end
end
