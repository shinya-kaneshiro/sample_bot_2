# frozen_string_literal: true

module WebHook
    # > # ポストバックイベント
    # > ユーザーが、ポストバックアクションを実行したことを示すイベントオブジェクトです。ポストバックイベントには応答できます。
    # https://developers.line.biz/ja/reference/messaging-api/#postback-event
    class ProficiencyMessage
      def self.send(value)
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
                "text": "習熟度を「#{value}」に設定しました。",
                "weight": "bold",
                "color": "#4169e1",
                "size": "sm"
              },
              {
                "type": "separator",
                "margin": "xs"
              },
              {
                "type": "box",
                "layout": "vertical",
                "margin": "sm",
                "spacing": "sm",
                "contents": [
                  {
                    "type": "box",
                    "layout": "horizontal",
                    "contents": [
                      {
                        "type": "text",
                        "text": "続けますか？",
                        "size": "xxl",
                        "color": "#555555",
                        "flex": 0,
                        "weight": "bold",
                        "offsetTop": "sm"
                      }
                    ]
                  }
                ]
              }
            ]
          },
          "footer": {
            "type": "box",
            "layout": "horizontal",
            "contents": [
              {
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "続ける",
                  "data": "type=question_request"
                },
                "style": "primary",
                "color": "#4169e1",
                "offsetEnd": "xs"
              },
              {
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "終わる",
                  "data": "type=revenge_end"
                },
                "style": "primary",
                "color": "#ff7f50",
                "offsetStart": "xs"
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