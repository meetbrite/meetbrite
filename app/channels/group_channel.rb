class GroupChannel < ApplicationCable::Channel
  def subscribed
     stream_from "group_channel_#{params[:event_id]}" 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
