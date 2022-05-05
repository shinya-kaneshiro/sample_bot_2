module WebhooksHelper
    def get_question
        #answering_status = Answering.first
        #answering_status.answering_id = 0
        #answering_status.save
        # @question = Question.first.question
        question_rand_id = Question.find(rand(1..Question.count)).id
        @question = Question.find(question_rand_id).question
        answering_status = Answering.first
        answering_status.answering_id = question_rand_id
        answering_status.save
    end

    def get_correct
        answering_status = Answering.first.answering_id
        correct = Question.find(answering_status).correct
        @correct = "#{correct}\n- - - - - - - - - -\n習熟度を設定してください。"
    end

    def update_proficiency(text)
        answering_status = Answering.first.answering_id
        question = Question.find(answering_status)
        question.proficiency = text.slice(-1)
        question.save
    end
end
