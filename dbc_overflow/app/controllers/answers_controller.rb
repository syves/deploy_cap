class AnswersController < ApplicationController

   def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.save
    if request.xhr?
      respond_to do |format|
        format.html
        format.js{render :create}
      end
    else
      redirect_to @question
    end
   end



    def upvote
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @answer.votes +=1
    @answer.save
    if request.xhr?
      respond_to do |format|
        format.html
        format.js{render :vote}
      end
    else
      redirect_to question_path(@question)
    end
  end

  def downvote
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @answer.votes -=1
    @answer.save
    if request.xhr?
      respond_to do |format|
        format.html
        format.js{render :vote}
      end
    else
      redirect_to question_path(@question)
    end
  end
private
    def answer_params
      params.require(:answer).permit(:content)
    end

end
