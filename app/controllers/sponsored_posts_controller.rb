class SponsoredPostsController < ApplicationController
  def show
  	@sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
  	@topic = Topic.find(params[:topic_id])
  	@sponsored_post = SponsoredPost.new
  end

  def create
  	@sponsored_post = SponsoredPost.new
  	@sponsored_post.title = params[:sponsored_post][:title]
  	@sponsored_post.body = params[:sponsored_post][:body]
  	@sponsored_post.price = params[:sponsored_post][:price]
  	#@topic = Topic.find(params[:topic_id])
  	#@sponsored_post.topic = @topic
  	@sponsored_post.topic_id = params[:topic_id]

  	if @sponsored_post.save
  		flash[:notice] = "The new post was successfully saved."
  		redirect_to topic_sponsored_post_path(@sponsored_post.topic_id, @sponsored_post.id)
  	else
  		flash.now![:alert] = "The post was not saved."
  		render :new
  	end
  end

  def edit
  	@sponsored_post = SponsoredPost.find(params[:id])
  end

  def update
  	@sponsored_post = SponsoredPost.find(params[:id])
  	@sponsored_post.title = params[:sponsored_post][:title]
  	@sponsored_post.body = params[:sponsored_post][:body]
  	@sponsored_post.price = params[:sponsored_post][:price]

  	if @sponsored_post.save
  		flash[:notice] = "The post was successfully updated"
  		redirect_to topic_sponsored_post_path(@sponsored_post.topic_id, @sponsored_post.id)
  	else
  		flash.now![:alert] = "The post was not updated. Please try again."
  		render :edit
  	end
  end

  def destroy
    @sponsored_post = SponsoredPost.find(params[:id])

    if @sponsored_post.destroy
      flash[:notice] = "\"#{@sponsored_post.title}\" was deleted."
      redirect_to topic_path(@sponsored_post.topic_id)
    else
      flash.now[:alert] = "Post was not deleted."
      render :show
    end
  end
end
