class CommentsController < ApplicationController
	before_action :require_sign_in
	before_action :authorize_user, only: [:destroy]

	def create
		@post = Post.find(params[:post_id])
		comment = @post.comments.build(comment_params)
		comment.user = current_user

		if comment.save
			flash[:notice] = "Comment saved successfully."
			redirect_to topic_post_path(@post.topic_id, @post.id)
		else
			flash[:alert] = "Comment failed to save."
			redirect_to topic_post_path(@post.topic_id, @post.id)
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		comment = @post.comments.find(params[:id])
		if comment.destroy
			flash[:notice] = "Comment was deleted."
			redirect_to topic_post_path(@post.topic_id, @post.id)
		else
			flash[:alert] = "Comment could't be deleted. Try again."
			redirect_to topic_post_path(@post.topic_id, @post.id)
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:body)
		end

		def authorize_user
			comment = Comment.find(params[:id])
			unless current_user == comment.user || current_user.admin?
				flash[:alert] = "You do not have permission to delete comment."
				redirect_to topic_post_path(comment.post.topic_id, comment.post.id)
			end
		end
end
