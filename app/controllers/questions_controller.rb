class QuestionsController < ApplicationController

  before_action :set_user, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :new, :edit]
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_question, only: [:edit, :update, :destroy]
  before_action :set_questions, only: :index
  before_action :admin_user_reject, only: [:index, :new, :edit]

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
    @question.destroy
    flash[:success] = "#「問題ID: #{@question.id}」を削除しました。"
    user_questions_count = @user.questions.count
    if user_questions_count == 0
      redirect_to user_questions_path
    else
      referer_url = request.referer
      if referer_url.include?("?page=")
        redirect_url_base = referer_url.split('?page=').first
        last_page_number = referer_url.split('=').last
        redirect_page_number = user_questions_count % PAGE_NUMBER == 0 ? last_page_number.to_i - 1 : last_page_number
        redirect_url = "#{redirect_url_base}?page=#{redirect_page_number}"
      else
        redirect_url = referer_url
      end
      redirect_to "#{redirect_url}"
    end
      
  end

  private
    def question_params
      params.require(:question).permit(:question, :correct, :proficiency)
    end

end
