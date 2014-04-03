Time::DATE_FORMATS[:dayFormat] = "%d.%m.%Y"

class RobotsController < ApplicationController
	def new
		@robot = Robot.new
	end
	
	def create
		@newRobot = Robot.new(robot_params)
		if @newRobot.save
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
			redirect_to @curRobot
		else
			render 'edit'
		end
	end
	
	def destroy
		@curRobot = Robot.find(params[:id])
		@curRobot.destroy
		redirect_to robots_path
	end
	
	private
		def robot_params
			params.require(:robot).permit(:name, :description)
		end
end
