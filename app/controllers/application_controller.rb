class ApplicationController < ActionController::Base
  include SessionsHelper

  # paramsハッシュからユーザーを取得する。
  def set_user
    # @user = User.find(params[:id])
    @user = User.find(params[:user_id])
  end

  # 該当ユーザの問題レコードを全て取得する。
  # before_actionとして配置する際は、set_userより後段に記述しないと動作しない（はず）。
  def set_questions
    @questions = Question.where(user_id: @user.id)
  end

  # paramsハッシュから対象のquestionレコードを取得する。
  def set_question
    @question = Question.find(params[:id])
  end

  # bot用
  # メッセージ送信者のline_user_idが存在した場合にユーザーオブジェクトを格納する。
  # 検証結果も別途格納する。
  def check_result
    line_id = params[:events][0][:source][:userId]
    @extract = User.find_by(line_user_id: line_id)
    @check_result = @extract.present?
  end

end