class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    html = ApplicationController.render(
        partial: 'group_messages/message',
        locals: {message: message}
    )

    ActionCable.server.broadcast "group_channel_#{message.event_id}", html: html
  end


  
end
