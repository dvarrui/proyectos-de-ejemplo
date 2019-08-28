#!/usr/bin/env ruby

require 'telegram/bot'
token = '644014604:AAFphQGowc2kBn663ZxIVN1NpcoMQGKeBDE'
bot_username = '@dvarrui_bot'

puts "[INFO] Running bot #{$0}..."

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    puts " => #{message.text}"
    case message.text
    when "/hello#{bot_username}"
      bot.api.send_message(chat_id: message.chat.id, text: "Hello Word!")
    when "/byebye#{bot_username}"
      exit
    end
  end
end
