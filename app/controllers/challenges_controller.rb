class ChallengesController < ApplicationController
  before_action :set_user, only: [:new, :update, :ajax_update]


  def new
    if @user.questions.count >= 1
      id_array = @user.questions.pluck(:id)
      rand_question_id = id_array.sample(1).first
      answering_user = @user.answerings.first
      if @user.questions.count != 1
        while rand_question_id == answering_user.answering_id do
          rand_question_id = id_array.sample(1).first
        end
        @question = Question.find(rand_question_id)
        answering_user.answering_id = rand_question_id
        answering_user.save
        else
      @question = Question.find(rand_question_id)
      answering_user.answering_id = rand_question_id
      answering_user.save
      end
    else
      flash[:danger] = '問題が登録されていません。'
      redirect_to user_questions_path
    end
  end

  def update
    proficiency = params[:value].to_i
    question = Question.find(@user.answerings.first.answering_id)
    unless question.proficiency == proficiency
      question.proficiency = proficiency
      question.save
      flash[:success] = '習熟度を変更しました。'
    end
    redirect_to new_user_challenge_path
  end
  
  def ajax_update
    @text = Question.find(@user.answerings.first.answering_id).correct
  end
end
