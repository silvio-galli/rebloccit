class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def view
  end

  def new
  end

  def edit
  end
end
