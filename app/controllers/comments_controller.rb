class CommentsController < ApplicationController
	def create 
		@pin = Pin.find(params[:pin_id])
		@comment =@pin.comments.create(comment_params)
		@comment.user_id = current_user.id 
		if @comment.save 
			redirect_to @pin
		end  
	end 


	private 
	def comment_params 
		params.require(:comment).permit(:description)
	end

end
