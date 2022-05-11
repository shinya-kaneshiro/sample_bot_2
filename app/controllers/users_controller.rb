class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
  #  ActiveRecord::Base.transaction do
      @user = User.new(user_params)
      if @user.save
        log_in(@user)
        answering = Answering.new(user_id: @user.id)
        answering.save
        flash[:success] = "新規登録に成功しました。"
        redirect_to user_questions_path @user
        # redirect_to user_path user
      else
        render :new
      end
  #  end
  #rescue ActiveRecord::RecordInvalid
  #  flash[:danger] = "新規登録に失敗しました。改めて実施してください。"
  #  render :new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "アカウント情報を更新しました。"
      redirect_to user_questions_path @user
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :line_user_id)
    end

end
