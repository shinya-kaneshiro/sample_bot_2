# coding: utf-8


# ユーザー作成
User.create!(name: "サンプルユーザー1",
    email: "sample@email.com",
    password: "password",
    password_confirmation: "password",
    admin: false
)

User.create!(name: "サンプルユーザー2",
    email: "sample2@email.com",
    password: "password",
    password_confirmation: "password",
    admin: false
)

User.create!(name: "admin",
    email: "sample2@email.com",
    password: "password",
    password_confirmation: "password",
    admin: true
)


# 回答中ステータス
#Answering.create!(answering_id: 1)


# 問題作成
Question.create!(question: "「環境変数」とはなにか？",
                 correct: "機密情報をOS上に保存して、必要なときに呼び出す。そのように管理された情報を環境変数と呼ぶ。",
                 proficiency: 1,
                 user_id: 1
                )

Question.create!(question: "「curl」とはなにか",
                 correct: "HTTPなど様々なプロトコルを用いてデータを転送するライブラリ・コマンドラインツールを提供するプロジェクト",
                 proficiency: 1,
                 user_id: 1
                )

Question.create!(question: "「JSONPlaceholder」とはなにか？",
                 correct: "JSONPlaceholderはJSON形式のテストデータを返すAPIを無料で提供しており、GETだけでなくPOSTやPUT、DELETEなどのメソッドに対応していて、curlコマンドなどの動作確認に便利なサービス",
                 proficiency: 1,
                 user_id: 1
                )
Question.create!(question: "「attr_accessor」とはなにか？",
                 correct: "「あとりびゅーと　あくせさー」と読む。クラスが外部からインスタンス変数にアクセス（参照・変更）する為の定義。",
                 proficiency: 1,
                 user_id: 1
                )
Question.create!(question: "「コレクション」とはなにか？",
                 correct: "コレクションとは、いくつかのオブジェクトをまとめて取り扱う為の「容器」として振る舞うオブジェクト。代表的なものとして、ArrayやHashがある。",
                 proficiency: 1,
                 user_id: 1
                )
Question.create!(question: "「コンストラクタ」とはなにか？",
                 correct: "コレクションとは、いくつかのオブジェクトをまとめて取り扱う為の「容器」として振る舞うオブジェクト。代表的なものとして、ArrayやHashがある。",
                 proficiency: 1,
                 user_id: 1
                )



# 注意事項：範囲選択でコメントアウトした時、末尾の「=end」の前方にスペースが入ってると、seedファイル反映時にエラーになる。