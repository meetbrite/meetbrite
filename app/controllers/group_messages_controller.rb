class GroupMessagesController < ApplicationController

    def display_messages 
        #how can we verify that the user is part of the event? 
        @event = Event.find(params[:event_id])
        @messages = GroupMessage.where(event_id: params[:event_id])
    end 
end
