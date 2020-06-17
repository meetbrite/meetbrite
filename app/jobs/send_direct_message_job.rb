class SendDirectMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    sender = ApplicationController.render(
      partial: 'direct_messages/sender',
      locals: {message: message}
    )
    receiver = ApplicationController.render(
      partial: 'direct_messages/receiver',
      locals: {message: message}
    )


    direct_id = [message.sender_id, message.receiver_id].sort().join("") #direct_chat id (generated uniquely based on user and receiver id)

  ActionCable.server.broadcast "direct_channel_#{direct_id}", sender: sender, receiver: receiver, message: message 
  end
end