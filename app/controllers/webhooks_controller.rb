class WebhooksController < ApplicationController
  include WebhooksHelper

  protect_from_forgery :except => :callback
  before_action :validate_signature, only: :callback
  before_action :check_result, only: :callback


  def callback
    client.parse_events_from(body).each do |event|
      client.reply_message(event['replyToken'], message(event))
    end
    head :ok
  end

  private

  def body
    @body ||= request.body.read
  end

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_id = Rails.application.credentials.channel_id
      config.channel_secret = Rails.application.credentials.channel_secret
      config.channel_token = Rails.application.credentials.channel_token
    end
  end

  def validate_signature
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    head :bad_request unless client.validate_signature(body, signature)
  end

  def events
    @events ||= client.parse_events_from(body)
  end

  def message(event)
    case event
    when Line::Bot::Event::Postback
      type = event['postback']['data']
      data = URI.decode_www_form(type).to_h
  
      if data['type'] == 'question_request'
        get_question()
        WebHook::QuestionMessage.send(@question)

      elsif data['type'] == 'id_get'
        get_line_id()
        [ {"type": "text", "text": "あなたのID" }, {"type": "text", "text": @line_id } ]

      elsif data['type'] == 'id_collation'
        check_id()
        {"type": "text", "text": @check_message }

      elsif data['type'] == 'proficiency'
        value = data['value'].to_i
        if update_proficiency(value)
          WebHook::ProficiencyMessage.send(value)
        else
        {"type": "text", "text": "習熟度の設定に失敗しました。改めて実行するか、システム管理者へ問い合わせて下さい。" }
        end
      elsif data['type'] == 'revenge_end'
        {"type": "text", "text": "お疲れ様でした！" }
        
        # 癒し系の画像を予め登録して置いて、ランダムで表示させるのもいいかも。
      end
    when Line::Bot::Event::Message
      get_correct
      WebHook::CorrectMessage.send(@correct)
      #case event['message']['type']
      #when 'sticker' # スタンプイベントの時
        # === ここに追加する ===
        # === ここに追加する ===
      #when 'text' # メッセージイベントの時
      #  # event['message']['text'] = ユーザーが送ってきた
      #  if event['message']['text'] =~ /カテゴリ/
      #    LineBot::Messages::LargeCategoriesMessage.new.send
      #  elsif event['message']['text'] =~ /FlexMessage/
      #    LineBot::Messages::SampleMessage.new.send
      #  elsif event['message']['text'] =~ /じゃんけん/
      #    LineBot::Messages::JankenMessage.new.send
      #  # === ここに追加する ===
      #  # === ここに追加する ===
      #  else
      #    {
      #      "type": "text",
      #      "text": event['message']['text']
      #    }
      #  end
      #end
    end
  end
end