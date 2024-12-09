class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = policy_scope(Question)
    @question = Question.new
  end

  def create
    @questions = policy_scope(Question) # needed in case of validation error
    @question = Question.new(question_params)
    authorize @question
    @question.user = current_user
    if @question.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:questions, partial: "questions/question",
            locals: { question: @question })
        end
        format.html { redirect_to questions_path }
      end
    else
     render :index, status: :unprocessable_entity
    end
  end

  def show
    @question = Question.find(question_params[:id])
    authorize @question
  end

  private

  def question_params
    params.require(:question).permit(:user_question)
  end
end
