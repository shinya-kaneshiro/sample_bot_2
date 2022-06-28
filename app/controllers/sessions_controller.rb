class SessionsController < ApplicationController

  def new
    logged_in_user_redirect
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.admin?
        flash[:success] = "ログインしました。"
        redirect_to users_path
      else
        user.last_login = Time.now
        user.save
        flash[:success] = "ログインしました。"
        redirect_to user_questions_path user
        #redirect_to questions_new_user_path user
        #redirect_to questions_top_user_path user
        # render :new
      end
    else
      flash.now[:danger] = "認証に失敗しました。"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

end
