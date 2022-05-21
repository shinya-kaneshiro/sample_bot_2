# frozen_string_literal: true

module WebHook
    # > # ポストバックイベント
    # > ユーザーが、ポストバックアクションを実行したことを示すイベントオブジェクトです。ポストバックイベントには応答できます。
    # https://developers.line.biz/ja/reference/messaging-api/#postback-event
    class CorrectMessage
      def self.send(correct)
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
                "text": "問題ID: #{correct.id}の回答",
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
                        "text": correct.correct,
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
                    "text": "習熟度を設定してください。",
                    "size": "xs",
                    "color": "#aaaaaa",
                    "flex": 0
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
                  "label": "1",
                  "data": "type=proficiency&value=1"
                },
                "style": "primary",
                "color": "#fa8072",
                "offsetEnd": "sm"
              },
              {
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "2",
                  "data": "type=proficiency&value=2"
                },
                "style": "primary",
                "color": "#f0e68c"
              },
              {
                "type": "button",
                "action": {
                  "type": "postback",
                  "label": "3",
                  "data": "type=proficiency&value=3"
                },
                "style": "primary",
                "color": "#00bfff",
                "offsetStart": "sm"
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