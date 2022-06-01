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
  # before_actionとして配置する際は、set_userより後段に記述しないと動作しない（はず）。
  def set_questions
    # @questions = Question.where(user_id: @user.id)
    # @questions = Question.paginate(page: params[:page], per_page: PAGE_NUMBER)
    @questions = @user.questions.paginate(page: params[:page], per_page: PAGE_NUMBER)
  end

  # paramsハッシュから対象のquestionレコードを取得する。
  def set_question
    @question = Question.find(params[:id])
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

end