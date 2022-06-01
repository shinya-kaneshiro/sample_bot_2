class QuestionsController < ApplicationController

  before_action :set_user, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_question, only: [:edit, :update, :destroy]
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
    #@question.proficiency = 1
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
    if @question.update(question_params)
      flash[:success] = "内容を更新しました。"
      redirect_to user_questions_path
    else
      render :edit
    end
  end

  def destroy
    # question_user_id = @question.user_id
    @question.destroy
    flash[:success] = "#「問題ID: {@questin.id}」を削除しました。"
    user_questions_count = @user.questions.count
    if user_questions_count == 0
      redirect_to user_questions_path
    else
      redirect_url_base = request.referer.split('=').first
      last_page_number = request.referer.split('=').last
        # user_questions_count = Question.where(user_id: question_user_id).count
      redirect_page_number = user_questions_count % PAGE_NUMBER == 0 ? last_page_number.to_i - 1 : last_page_number
      redirect_url = "#{redirect_url_base}=#{redirect_page_number}"
      redirect_to redirect_url
    end
      
  end

  private
    def question_params
      params.require(:question).permit(:question, :correct, :proficiency)
    end

    #def question_edit_params
    #  params.require(:question).permit(:question, :correct, :proficiency)
    #end

end
