module WebhooksHelper
    def get_question
        id_array = @extract.questions.pluck(:id)
        rand_question_id = id_array.sample(1).first
        #@question = Question.find(rand_question_id).question
        @question = Question.find(rand_question_id)
        answering_user = @extract.answerings.first
        answering_user.answering_id = rand_question_id
        answering_user.save
    end

    def get_correct
        answering_status()
        @correct = Question.find(answering_status)
        #correct = Question.find(answering_status).correct
        #@correct = "#{correct}\n- - - - - - - - - -\n習熟度を設定してください。"
    end

    def update_proficiency(value)
        answering_status()
        question = Question.find(answering_status)
        question.proficiency = value
        if question.save
            @update_message = '習熟度を設定しました。'
        else
            @update_message = false
        end
    end

    def get_line_id()
        @line_id = params[:events][0][:source][:userId]
    end

    def check_id()
        #check_result()
        if @check_result
          @check_message = 'ID登録済み'
        else
          @check_message = '登録されていません'
        end
    end

# application_controller.rbへ移設してbefore_actionにした。
#    def check_result()
#        line_id = params[:events][0][:source][:userId]
#        @extract = User.find_by(line_user_id: line_id)
#        @check_result = @extract.present?
#    end

    def answering_status()
        answering_status = @extract.answerings.first.answering_id
    end
end
