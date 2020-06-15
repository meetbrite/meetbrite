class SendDirectMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    html = ApplicationController.render(
      partial: 'direct_messages/message',
      locals: {message: message}
  )
    direct_id = [message.sender_id, message.receiver_id].sort().join("") #direct_chat id (generated uniquely based on user and receiver id)

  ActionCable.server.broadcast "direct_channel_#{direct_id}", html: html
  end
end