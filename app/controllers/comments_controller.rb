class CommentsController < ApplicationController

	def create
		@comment = Comment.new
		@comment.person_id = params[:person_id]
		@comment.text = params[:text]
		@comment.save
		redirect_to person_path(params[:person_id])
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to person_path(params[:person_id])
	end
end
