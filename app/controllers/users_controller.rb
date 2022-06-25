class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :logged_in_user, only: [:edit, :index]
  before_action :correct_user,  only: [:edit, :update]
  before_action :admin_user,  only: [:index, :destroy]

  def new
    result = logged_in_user_redirect
    if result.nil?
      @user = User.new
    end
  end

  def create
  #  ActiveRecord::Base.transaction do
      @user = User.new(user_params)
      @user.last_login = Time.now
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

  def index
    @users = User.where.not(id: current_user.id).order(id: :asc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "アカウント情報を更新しました。"
      if @user.admin?
        redirect_to users_path
      else
        redirect_to user_questions_path @user
      end
    else
      render :edit
    end
  end

  def destroy
    user = User.find(@user.id)
    user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :line_user_id)
    end

end
