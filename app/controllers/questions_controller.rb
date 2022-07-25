class QuestionsController < ApplicationController

  before_action :set_question, only: %i[update show destroy edit]

  def create
    q = Question.create(question_params)

    redirect_to question_path(q)
  end

  def show

  end

  def new
    @question = Question.new
  end

  def index
    @question = Question.new
    @questions = Question.all
  end

  def edit

  end

  def update
    @question.update(question_params)

    redirect_to question_path(@question)
  end

  def destroy
    @question.destroy

    redirect_to questions_path
  end

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end

end
