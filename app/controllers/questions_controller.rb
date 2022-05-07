class QuestionsController < ApplicationController

  before_action :set_user, only: [:index, :new, :create]
  before_action :set_questions, only: :index

  def new
    @question = Question.new
  end

  def index
  end

  def create
    #@question = question.new(question_params)
    @question = Question.new(question: params[:question][:question], correct: params[:question][:correct])
    @question.user_id = @user.id
    @question.proficiency = 1
    if @question.save
      flash[:success] = "問題を新規作成しました。"
      redirect_to user_questions_path
    else
      render :new
    end
  end

end
