# frozen_string_literal: true

module WebHook
    # > # ポストバックイベント
    # > ユーザーが、ポストバックアクションを実行したことを示すイベントオブジェクトです。ポストバックイベントには応答できます。
    # https://developers.line.biz/ja/reference/messaging-api/#postback-event
    class QuestionMessage
      def self.send(question)
        [
         "type": "flex",
         "altText": "this is a flex message",
         "contents": 
         {
            "type": "bubble",
            "body": {
              "type": "box",
              "layout": "vertical",
              "contents": [
                {
                  "type": "text",
                  "text": "問題ID:#{question.id}",
                  "weight": "bold",
                  "color": "#1DB446",
                  "size": "sm"
                },
                {
                  "type": "separator",
                  "margin": "xs"
                },
                {
                  "type": "box",
                  "layout": "vertical",
                  "margin": "xs",
                  "spacing": "sm",
                  "contents": [
                    {
                      "type": "box",
                      "layout": "horizontal",
                      "contents": [
                        {
                          "type": "text",
                          "text": question.question,
                          "size": "sm",
                          "color": "#555555",
                          "flex": 0,
                          "wrap": true
                        }
                      ]
                    }
                  ]
                },
                {
                  "type": "separator",
                  "margin": "md"
                },
                {
                  "type": "box",
                  "layout": "horizontal",
                  "margin": "md",
                  "contents": [
                    {
                      "type": "text",
                      "text": "キーボードアイコンをタップして、回答内容を送信してください。",
                      "size": "xs",
                      "color": "#aaaaaa",
                      "flex": 0,
                      "wrap": true
                    }
                  ]
                }
              ]
            },
            "styles": {
              "footer": {
                "separator": true
              }
            }
              }
        ]

      end
    end
  end