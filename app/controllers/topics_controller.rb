class TopicsController < ApplicationController
	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.find(params[:id])
	end

	def new
		@topic = Topic.new
	end

	def create
		@topic = Topic.new
		@topic.name = params[:topic][:name]
		@topic.description = params[:topic][:description]
		@topic.public = params[:topic][:public]

		if @topic.save
			flash[:notice] = "New Topic successfully created!"
			redirect_to topic_path(@topic.id)
		else
			flash.now[:alert] = "Topic wasn't saved correctly. Please try again."
			render :new
			end
	end

	def edit
		@topic = Topic.find(params[:id])
	end

	def update
		@topic = Topic.find(params[:id])
		@topic.name = params[:topic][:name]
		@topic.description = params[:topic][:description]
		@topic.public = params[:topic][:public]

		if @topic.save
			flash[:notice] = "Topic updated successfully"
			redirect_to topic_path(@topic.id)
		else
			flash.now[:alert] = "Topic wasn't updated. Please try again."
			render :edit
		end
	end

	def destroy
		@topic = Topic.find(params[:id])

		if @topic.destroy
			flash[:notice] = "Topic was successfully deleted!"
			redirect_to action: :index # possibile topics_path
		else
			flash.now[:alert] = "Topic wasn't deleted"
			render :show
		end
	end
end
