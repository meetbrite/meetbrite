class DirectChannel < ApplicationCable::Channel
  def subscribed
     stream_from "direct_channel_#{params[:direct_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
