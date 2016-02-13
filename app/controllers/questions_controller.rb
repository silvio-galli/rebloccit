class QuestionsController < ApplicationController
  def index
  	@question = Question.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  def edit
  	@question = Question.find(params[:id])
  end

  def update
  	@question = Question.find(params[:id])
  	@question.title = params[:question][:title]
  	@question.body = params[:question][:body]
  	@question.resolved = params[:question][:resolved]

  	if @question.save
  		flash[:notice] = "Question was updated successfully."
  		redirect_to question_path(@question.id)
  	else
  		flash.now[:alert] = "Question wasn't updated. Please try again."
  		render :edit
  	end
  end

  def new
  	@question = Question.new
  end

  def create
  	@question = Question.new
  	@question.title = params[:question][:title]
  	@question.body = params[:question][:body]
  	@question.resolved = params[:question][:resolved]

  	if @question.save
  		flash[:notice] = "Question \"#{@question.title}\" was created successfully."
  		redirect_to question_path(@question.id)
  	else
  		flash.now[:alert] = "Sorry, question wasn't created."
  		render :new
  	end
  end

  def destroy
  	@question = Question.find(params[:id])
  	if @question.destroy
  		flash[:notice] = "Question was successfully deleted."
  		redirect_to questions_path
  	else
  		flash.now[:alert] = "Question wasn't deleted"
  		render :show
  	end
  end

end
