class QuestionsController < ApplicationController
  before_action :find_question, except: [:index, :create, :new]
  respond_to :html, :js


  def index
    @question = Question.new
    @questions = Question.all
    headers["User-Agent"] = ENV['USERNAME']
    headers["Authorization"] = ENV['KEY']
    @response = HTTParty.get("https://api.github.com/zen", headers: headers)
    @response = "All's well that ends well" if @response.code != 200
  end

  def show
    # shows a specific question with all its answers
    @answer = Answer.new
  end

  def new
    render index
  end

   def create
    @question = Question.create(question_params)
    respond_to do |format|
      format.html
      format.js{render :create}
    end
   end

  def edit
  end

  def upvote
    @question.votes += 1
    @question.save
    respond_to do |format|
      format.html
      format.js{render :vote}
    end
  end

  def downvote
    @question.votes -= 1
    @question.save
     respond_to do |format|
      format.html
      format.js{render :vote}
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render edit
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      if request.xhr?
        format.html
        format.js{render :remove}
      else
        format.html {redirect_to questions_path}
      end
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :content, :votes)
    end


    def find_question
      @question = Question.find(params[:id])
    end
end
