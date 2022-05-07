class QuestionsController < ApplicationController

  before_action :set_user, only: [:index, :new, :create, :edit, :update]
  before_action :set_question, only: [:edit, :update]
  before_action :set_questions, only: :index

  def new
    @question = Question.new
  end

  def index
  end

  def create
    @question = Question.new(question_params)
    #@question = Question.new(question: params[:question][:question], correct: params[:question][:correct])
    @question.user_id = @user.id
    @question.proficiency = 1
    if @question.save
      flash[:success] = "問題を新規作成しました。"
      redirect_to user_questions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(question_edit_params)
      flash[:success] = "内容を更新しました。"
      redirect_to user_questions_path
    else
      render :edit
    end
  end

  private
    def question_params
      params.require(:question).permit(:question, :correct)
    end

    def question_edit_params
      params.require(:question).permit(:question, :correct, :proficiency)
    end

end
