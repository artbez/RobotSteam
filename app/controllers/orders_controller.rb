class OrdersController < ApplicationController
	
	def create
		@robot = Robot.find(params[:robot_id])
		@order = @robot.orders.create()
		redirect_to @robot
	end
	
	def index
		@orders = Order.all
	end
	
	private
		def order_params
			params.require(:order).permit(:id)
		end
end
