class AdvertisementsController < ApplicationController
  def index
  	@advertisements = Advertisement.all
  end

  def show
  	@advertisement = Advertisement.find(params[:id])
  end

  def new
  	@advertisement = Advertisement.new
  end

  def create
  	@advertisement = Advertisement.new
  	@advertisement.title = params[:advertisement][:title]
  	@advertisement.body = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]
    if @advertisement.save
      flash[:notice] = "The advertisement was successfully saved."
      redirect_to @advertisement
    else
      flash.now[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end
end
