class ApplicationController < ActionController::Base
  include SessionsHelper

  # will-pagenateの表示レコード数
  PAGE_NUMBER = 10

  # paramsハッシュからユーザーのidを取得する。
  def set_user
    if controller_name == "users"
      @user = User.find(params[:id])
    else
      @user = User.find(params[:user_id])
    end
  end

  # 該当ユーザの問題レコードを全て取得する。
  def set_questions
    @questions = @user.questions.paginate(page: params[:page], per_page: PAGE_NUMBER)
  end

  # paramsハッシュから対象のquestionレコードを取得する。
  def set_question
    question = Question.find(params[:id])
    if question.user_id == @user.id
      @question = @user.questions.find(params[:id])
    else
      flash[:danger] = "対象の問題IDにはアクセスできません。"
      redirect_to user_questions_path 
    end
  end

  # bot用
  # メッセージ送信者のline_user_idが存在した場合にユーザーオブジェクトを格納する。
  # 検証結果も別途格納する。
  def check_result
    if params[:events].present?
      line_id = params[:events][0][:source][:userId]
      @extract = User.find_by(line_user_id: line_id)
      @check_result = @extract.present?
    end
  end

  # ログイン済みのユーザーか確認し、未ログインならログインページへ遷移させる。
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end

  # アクセスしたユーザーが現在ログインしているユーザーか確認する。
  def correct_user
    if params[:user_id].nil?
      @user = User.find(params[:id])
    else
      @user = User.find(params[:user_id])
    end
    unless current_user?(@user)
      flash[:danger] = "アクセス権限がありません。"
      redirect_to(root_url)
    end
  end

  # 管理者権限を保有していない場合、アクセスを拒否する。
  def admin_user
    unless current_user.admin?
      flash[:danger] = "アクセス権限がありません。"
      redirect_to root_url
    end
  end

  # 管理者権限を保有している場合、アクセスを拒否する。
  def admin_user_reject
    if current_user.admin?
      flash[:danger] = "アクセス権限がありません。"
      redirect_to root_url
    end
  end

  # ログイン済みユーザーの場合、ログイン後の画面に強制遷移させる。
  def logged_in_user_redirect
    if logged_in?
      flash_message = controller_name == "users" ? "新規アカウントを作成する場合は、ログアウトしてください。" : "すでにログインしています。"
      flash[:danger] = "#{flash_message}"
      user = current_user
      if user.admin?
        redirect_to users_path(user)
      else
        redirect_to user_questions_path(user)
      end
    end
  end
end