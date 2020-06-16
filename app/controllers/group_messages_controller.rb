class GroupMessagesController < ApplicationController

    def display_messages 
        @user = current_user  #gets the current logged-in user 
        @event = Event.find(params[:event_id])
        @joined = @event.is_user_joined(@user) 
        if @joined            #verify if user is allowed to see the event's chat
            @messages = GroupMessage.where(event_id: params[:event_id])
            @members = @event.users 
        else 
            redirect_back(fallback_location: user_path(@user))
        end 
    end 

    def create
        @message = GroupMessage.create(user_id: session[:user_id], event_id: params[:event_id], message: params[:message])
        #redirect_to request.referrer 
        # ActionCable.server.broadcast "group_channel_#{@message.event_id}", message: @message.message 
        SendMessageJob.perform_later(@message)
    end 
end
