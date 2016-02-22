class PostsController < ApplicationController
  
  before_action :require_sign_in, except: :show

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
  	@post = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user
  	
    if @post.save
  		flash[:notice] = "Post was saved."
  		redirect_to topic_post_path(@topic.id, @post.id)
  	else
  		flash.now[:alert] = "There was an error saving the post. Please try again."
  		render :new
  	end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    
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

  scope :ordered_by_title, -> { order('title ASC') }
  scope :ordered_by_reverse_created_at, -> { order('created_at ASC') }

  private
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
