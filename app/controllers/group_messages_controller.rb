class GroupMessagesController < ApplicationController

    def display_messages 
        @user = current_user  #gets the current logged-in user 
        @event = Event.find(params[:event_id])
        @joined = @event.is_user_joined(@user) 
        if @joined            #verify if user is allowed to see the event's chat
            @messages = GroupMessage.where(event_id: params[:event_id])
        else 
            redirect_back(fallback_location: user_path(@user))
        end 
    end 
end
