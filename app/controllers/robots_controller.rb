Time::DATE_FORMATS[:dayFormat] = "%d.%m.%Y"

class RobotsController < ApplicationController
	def new
		@robot = Robot.new
	end
	
	def create
		@newRobot = Robot.new(robot_params)
		if @newRobot.save
			uploadPhoto(@newRobot)
			redirect_to @newRobot
		else
			render 'new'
		end
	end
	
	def show
		@curRobot = Robot.find(params[:id])
	end
	
	def index
		@robots = Robot.all
	end
	
	def edit
		@robot = Robot.find(params[:id])
	end
	
	def update
		@curRobot = Robot.find(params[:id])
		
		if @curRobot.update(robot_params)
			uploadPhoto(@curRobot)
			redirect_to @curRobot
		else
			render 'edit'
		end
	end
	
	def destroy
		@curRobot = Robot.find(params[:id])
		if (@curRobot.photoPath != nil)
			File.delete(@curRobot.photoPath)
		end
		@curRobot.destroy
		redirect_to robots_path
	end
	
	private
		def robot_params
			params.require(:robot).permit(:name, :description, :photoPath)
		end
		def uploadPhoto(curRobot)
			uploaded_io = params[:robot][:photo]
			if uploaded_io == nil
				return
			else
				oldFilename = uploaded_io.original_filename
			end
			tempSplit = oldFilename.split('.')
			format = '.' + tempSplit[tempSplit.size - 1]
			newPhotoPath = Rails.root.join('app', 'assets', 'images', 'robotphoto_' + curRobot.id.to_s + format)
			
			File.open(newPhotoPath, 'wb')  do |file|
				file.write(uploaded_io.read)
			end
			
			curRobot.photoPath = newPhotoPath.to_s
			curRobot.update(robot_params)
		end
end
