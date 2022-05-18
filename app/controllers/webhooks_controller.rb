class WebhooksController < ApplicationController
  before_action :check_result

  include WebhooksHelper

  protect_from_forgery except: :callback

  #OMAJINAI = /アブラカタブラ|チチンプイプイ|ヒラケゴマ/
  #TOKUTEI = "mp"
  #TOKUTEI = /mp|kai_./
  #TOKUTEI = /mp|kai_.|s[1-5]/
  TOKUTEI_MP = "mp"
  TOKUTEI_K = "kai_."
  TOKUTEI_S = "s[1-5]"
  TOKUTEI_ID = "id"
  TOKUTEI_IDC = "idc"



  def callback
    client = Line::Bot::Client.new do |config|
      config.channel_id = Rails.application.credentials.channel_id
      config.channel_secret = Rails.application.credentials.channel_secret
      config.channel_token = Rails.application.credentials.channel_token
    end

    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    return head :bad_request unless client.validate_signature(body, signature)

    events = client.parse_events_from(body)
    events.each do |event|
      message = case event
                when Line::Bot::Event::Message
                  { type: 'text', text: parse_message_type(event) }
                #else
                #  { type: 'text', text: '........' }
                end
      client.reply_message(event['replyToken'], message)
    end
    head :ok
  end

  private

  def parse_message_type(event)
    case event.type
    when Line::Bot::Event::MessageType::Text
      reaction_text(event)   # ユーザーが投稿したものがテキストメッセージだった場合に返す値
    else
      'Thanks!!'             # ユーザーが投稿したものがテキストメッセージ以外だった場合に返す値
    end
  end

  def reaction_text(event)
    #data = params[:events][0][:postback][:data] # postbackの場合
    if @check_result
      # 定数TOKUTEI_MPに完全一致した場合
      #if event.message['text'] == TOKUTEI_MP
      #  get_question()
      #  @question
      if event.message['text'] == TOKUTEI_MP
        get_question()
        @question
      elsif event.message['text'].match?(TOKUTEI_K)
        get_correct()
        @correct
      elsif event.message['text'].match?(TOKUTEI_S)
        update_proficiency(event.message['text'])
        '習熟度を設定しました'
      #elsif event.message['text'].match?(TOKUTEI_ID)
      elsif event.message['text'] == TOKUTEI_ID
        get_line_id()
        @line_id
      #elsif event.message['text'].match?(TOKUTEI_IDC)
      elsif event.message['text'] == TOKUTEI_IDC
        check_id()
        @check_message
      else
        event.message['text']                     # 上記２つに合致しない投稿だった場合、投稿と同じ文字列を返す
      end
    else
      'IDが登録されていません'
    end
  end

end