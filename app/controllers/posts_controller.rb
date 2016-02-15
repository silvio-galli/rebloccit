class PostsController < ApplicationController
  
  def show
  	@post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
  	@post = Post.new
  end

  def create
  	@post = Post.new
  	@post.title = params[:post][:title]
  	@post.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])
    @post.topic = @topic
  	
    if @post.save
  		flash[:notice] = "Post was saved."
  		redirect_to topic_post_path(@topic.id, @post.id)
  	else
  		flash.now[:alert] = "There was an error saving the post Please try again."
  		render :new
  	end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    
    if @post.save
      flash[:notice] = "Post was successfully updated!"
      redirect_to topic_post_path(@post.topic_id, @post.id)
    else
      flash.now[:alert] = "Something went wrong. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted!"
      redirect_to topic_path(@post.topic_id)
    else
      flash.now[:alert] = "Sorry, the post wasn't deleted."
      render :show
    end
  end
end
