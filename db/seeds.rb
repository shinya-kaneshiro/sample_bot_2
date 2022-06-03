# coding: utf-8


# ユーザー作成
User.create!(name: "サンプルユーザー1",
    email: "sample@email.com",
    password: "password",
    password_confirmation: "password",
    last_login: Time.now,
    admin: false
)

User.create!(name: "サンプルユーザー2",
    email: "sample2@email.com",
    password: "password",
    password_confirmation: "password",
    last_login: Time.now,
    admin: false
)

User.create!(name: "admin",
    email: "admin@email.com",
    password: "password",
    password_confirmation: "password",
    last_login: Time.now,
    admin: true
)
User.create!(name: "admin2",
    email: "admin2@email.com",
    password: "password",
    password_confirmation: "password",
    last_login: Time.now,
    admin: true
)


# 回答中ステータス
#Answering.create!(answering_id: 1)
Answering.create!(answering_id: 1,
    user_id: 1
)
Answering.create!(answering_id: 1,
    user_id: 2
)
Answering.create!(answering_id: 1,
    user_id: 3
)

# 問題作成(1～5)
Question.create!(question: "「環境変数」とはなにか？",
    correct: "機密情報をOS上に保存して、必要なときに呼び出す。\r\nそのように管理された情報を環境変数と呼ぶ。",
    proficiency: 1,
    user_id: 1
   )

Question.create!(question: "「curl」とはなにか",
    correct: "HTTPなど様々なプロトコルを用いてデータを転送するライブラリ・コマンドラインツールを提供するプロジェクト",
    proficiency: 1,
    user_id: 1
   )

Question.create!(question: "「JSONPlaceholder」とはなにか？",
    correct: "JSONPlaceholderはJSON形式のテストデータを返すAPIを無料で提供している。\r\nGETだけでなくPOSTやPUT、DELETEなどのメソッドに対応していて、curlコマンドなどの動作確認に便利なサービス",
    proficiency: 1,
    user_id: 1
   )
Question.create!(question: "「attr_accessor」とはなにか？",
    correct: "「あとりびゅーと　あくせさー」と読む。\r\nクラスが外部からインスタンス変数にアクセス（参照・変更）する為の定義。",
    proficiency: 1,
    user_id: 1
   )
Question.create!(question: "モデルのカラム名一覧を参照するコマンドはなにか？",
    correct: "モデル名.column_names",
    proficiency: 1,
    user_id: 1
   )

# 問題作成(6～10)
Question.create!(question: "「DOM」とはなにか？",
    correct: "・「Document Object Model」の略。\r\n
・HTMLをJavaScriptから操作できるようにしたインターフェイス。\r\n
・JavaScriptからは「DOM API」を通じて、HTMLの情報を取得・変更できる。\r\n
・情報の取得・変更・イベントの登録などができる。",
    proficiency: 1,
    user_id: 1
   )

Question.create!(question: "「webhook」とはなにか",
    correct: "Webhookとは、あるサービスでイベントが発生した際、事前に設定しておいたURLにイベントの内容をPOSTしてもらう仕組み。",
    proficiency: 1,
    user_id: 1
   )

Question.create!(question: "「bundle update」は、どのような処理を行うコマンドか？",
    correct: "bundle updateコマンドは「Gemfile.lockの記述を無視して、GemfileでのGemの指定やそのバージョン指定などに基づいて、gemを更新する。 更新時にGemfile.lockを更新する。」という処理を行う。",
    proficiency: 1,
    user_id: 1
   )
Question.create!(question: "ORM（Objext/RDB mapping）とはなにか？",
    correct: "ORMとは、「オブジェクト」と「RDBにおけるレコード」を対応づける（対照させる）こと。\r\n
O/Rマッパーを利用しない場合は、DB操作にはSQL文の記述が必要だが、O/Rマッパーを利用する場合は、簡易的な記述をするだけで、DB操作が可能になる。\r\n
なぜなら、O/Rマッパーが予め設定された対応関係の情報に基づいて、自動でSQL文の生成、発行を行い、DB操作に必要な事を裏でやってくれるから。",
    proficiency: 1,
    user_id: 1
   )
Question.create!(question: "O/R Mapper（Objext/RDB Mapper）とはなにか？",
    correct: "ORM（O/Rマッピング）用のフレームワークやライブラリの総称。\r\n
O/Rマッパーを用いる事で、簡易的な記述でDB操作が可能になる。\r\n
なぜなら、O/Rマッパーが予め設定された対応関係の情報に基づいて、自動でSQL文の生成、発行を行い、DB操作に必要な事を裏でやってくれるから。",
    proficiency: 1,
    user_id: 1
   )

# 問題作成(11～15)
Question.create!(question: "OOPにおけるオブジェクトとはなにか？",
    correct: "OOPにおけるオブジェクトとは、データ（属性）と機能（手続き）をひとかたまりにした実体のこと。\r\n
（例）\r\n
【データ(属性)】メーカー、排気量、色\r\n
【機能(手続き)】走る、曲がる、止まる\r\n
上記のクラス(設計書)を元に生成したインスタンス（メモリ上に展開された実体）をオブジェクトと捉える。\r\n
この例で言えば、上記の設計書を元に作成した車がオブジェクトに相当する。",
    proficiency: 1,
    user_id: 1
   )
Question.create!(question: "「SQL」とはなにか？",
    correct: "RDBMSを介してDBを操作する問い合わせ言語。\r\n（Structured Query Language）",
    proficiency: 1,
    user_id: 1
    )
Question.create!(question: "「ActiveRecordパターン」とはなにか？",
    correct: "・Martin Fowler氏の書籍で解説されている「デザインパターン」の1つ。\r\n
・「データベーステーブルまたはビューの行をラップし、データベースアクセスをカプセル化してデータにドメインロジックを追加するオブジェクト」と解説されているもの。",
    proficiency: 1,
    user_id: 1
    )
Question.create!(question: "「ActiveRecord」とはなにか",
    correct: "・Active Record(Active Recordライブラリ)は、SQLを意識せずにデータベースアクセスを行える便利なライブラリ。\r\n
・Active RecordはRailsのMVCのModelの中心となるライブラリ。",
    proficiency: 1,
    user_id: 1
    )
Question.create!(question: "「OOP」とはなにか？",
    correct: "・「Object Oriented Programming」の略\r\nOOP(オブジェクト指向プログラミング)とは、プログラムを手順ではなくて、モノの作成と操作として見る考え方。",
    proficiency: 1,
    user_id: 1
    )

# 問題作成(16～20)
Question.create!(question: "「method」とはなにか？",
    correct: "オブジェクトが持っている処理（機能や手続きとか）のこと。\r\nそのオブジェクトで起こすことができるアクションのことを「振る舞い」とも呼ぶこともある。",
    proficiency: 1,
    user_id: 1
   )
Question.create!(question: "「リポジトリ」とはなにか？",
    correct: "リポジトリとは、ファイルやディレクトリの「状態を記録」する場所。「状態を保存」する場所。",
    proficiency: 1,
    user_id: 1
   )
Question.create!(question: "rubyにおける「extend」とはなにか？",
    correct: "・読み込んだモジュールの「インスタンスメソッド」が、あるクラスの特異メソッドとして追加され、クラスメソッドとして利用できる。\r\n
・「extend モジュール名」と記述する事で、該当モジュールのインスタンスメソッドを、extendしたクラスの「クラスメソッドとして」扱うことが出来る。\r\n
・moduleファイル内に記載されたクラスメソッド（self.xxxx）は、使えない。\r\n
・includeのように、クラス間の継承関係の間にmodが組み込まれるわけではなく、あるクラス(Classクラスのオブジェクト）の特異メソッドとして追加される。",
    proficiency: 1,
    user_id: 1
   )
Question.create!(question: "「self」とはなにか？",
    correct: "一言で言うと、「オブジェクトそのものを指す特殊な変数」のこと。\r\n
・「トップレベル」でのselfは、mainというインスタンスを指す。\r\n
・「クラス内～クラスメソッド内部」でのselfは、クラス自身を指す\r\n
・「インスタンスメソッド内部」でのselfは、メソッドを呼び出したオブジェクト自身を指す",
    proficiency: 1,
    user_id: 1
   )
Question.create!(question: "rubyにおける「prepend」とはなにか？",
    correct: "・指定したモジュールの「インスタンスメソッド」を、prependしたクラスの「インスタンスメソッド」として扱える。\r\n
・「prepend モジュール名」と記述。\r\n
・組み込まれる位置（メソッド探索）はprependしたクラスの先頭（クラスより前）\r\n
・メソッド探索開始→「Mod」→「prependしたクラス」→「親クラス」→...\r\n
・クラスにモジュールをprependすると、クラスのインスタンスメソッドをモジュールで同名のメソッドを定義することによって、オーバーライド(上書き)することが出来る。",
    proficiency: 1,
    user_id: 1
    )

# 問題作成(21～25)
Question.create!(question: "rubyにおける「クラスメソッド」とはなにか？",
    correct: "【対象レシーバ】
クラスそのもの\r\n
\r\n
【呼び出す際の記述方法】
クラス名.メソッド名
クラス名::メソッド名
\r\n
【どこにどう書いてある？】
クラスファイル内に、「self.メソッド名」で、定義されている\r\n
\r\n
【サンプルコード】
Array.new
User.first",
    proficiency: 1,
    user_id: 1
    )
Question.create!(question: "rubyにおける「インスタンスメソッド」とはなにか？",
    correct: "【対象レシーバ】
nクラスから生成したインスタンス
nクラスに属するインスタンス
\r\n
【呼び出す際の記述方法】
インスタンス.メソッド名
クラス名::メソッド名
\r\n
【どこにどう書いてある？】
クラスファイル内で、メソッド名にself変数を使わずに、定義されているもの。initializeは除く。\r\n
\r\n
【サンプルコード】
user = User.find(1)
user.name\r\n
num = 100
num.to_s
※num変数に100というintegerクラスの値が入っているので、integerクラスに定義されているto_sメソッドが利用できる。",
    proficiency: 1,
    user_id: 1
    )
Question.create!(question: "rubyにおける「関数的メソッド」とはなにか？",
    correct: "【対象レシーバ】
無い ※1
\r\n
【呼び出す際の記述方法】
メソッド名\r\n
\r\n
【どこにどう書いてある？】
※1\r\n
\r\n
【サンプルコード】
print 'text'
sleep(30)
※1…関数的メソッドはKernelモジュールで定義されている。ObjectクラスはKernelモジュールをインクルードしているため、全てのクラスから参照できるメソッドということになる。",
    proficiency: 1,
    user_id: 1
    )
Question.create!(question: "rubyにおける「include」とはなにか？",
    correct: "・読み込んだモジュールの「インスタンスメソッド」を、そのクラスの「インスタンスメソッド」として利用できる。\r\n
・「include モジュール名」と記述する事で、該当モジュールのインスタンスメソッドを、includeしたクラスの「インスタンスメソッドとして」扱うことが出来る。\r\n
・moduleファイル内に記載されたクラスメソッド（self.xxxx）は、使えない。\r\n
・ただし、include対象とするモジュールファイル内でincludedによるClassMethodsのextendが記述されている場合は、クラスメソッドも利用可能となる。\r\n
・includeでは、「includeしたクラス」と「親クラス」の継承関係の間にmodが組み込まれる。\r\n
・メソッド呼び出し→「includeしたクラス」→「Mod」→「親クラス」→...",
    proficiency: 1,
    user_id: 1
    )
Question.create!(question: "rubyにおける「クラスの継承」とはなにか？",
    correct: "・Rubyは、単一継承のみ（子クラスが親クラスを1つ持つことが出来る）。\r\n
・クラスの継承では、「is a」が成り立つか考える必要がある。\r\n
「Teacher is a Person」、「Person is a Teacher」のように、\r\n
「先生は人である」、「人は先生である」という意味が成り立つ必要がある",
    proficiency: 1,
    user_id: 1
    )

# 問題作成(26～n)
Question.create!(question: "「メソッド探索」とはなにか？",
    correct: "・メソッド呼び出し時にメソッドを探す処理。\r\n
・システムがメソッド探索を行う場合、対象クラスから最上位クラスに向けて順番にメソッド探索を行う。\r\n
・同名のメソッドが存在している場合は、先に見つかったメソッドが処理される。\r\n
・moduleの追加方法（記述方法）によって、複数moduleを読み込んだ場合のメソッド探索順序が変わる。\r\n
※「include Mod1, Mod2」と記述した場合
メソッド探索開始→「対象クラス」→「Mod1」→「Mod2」の順\r\n
※ある行に「include Mod1」、下の行に「include Mod2」と記述した場合
メソッド探索開始→「対象クラス」→「Mod2」→「Mod1」の順",
    proficiency: 1,
    user_id: 1
    )




# 注意事項：範囲選択でコメントアウトした時、末尾の「=end」の前方にスペースが入ってると、seedファイル反映時にエラーになる。