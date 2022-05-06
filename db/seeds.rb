# coding: utf-8

User.create!(name: "Sample User",
    email: "sample@email.com",
    password: "password",
    password_confirmation: "password")



=begin 
Question.create!(question: "問題その1の内容",
                 correct: "その1の正解",
                 proficiency: 1
                )

Question.create!(question: "問題その2の内容",
                 correct: "その2の正解",
                 proficiency: 1
                )

Question.create!(question: "問題その3の内容",
                 correct: "その3の正解",
                 proficiency: 1
                )

Answering.create!(answering_id: 1)
=end

# 注意事項：範囲選択でコメントアウトした時、末尾の「=end」の前方にスペースが入ってると、seedファイル反映時にエラーになる。