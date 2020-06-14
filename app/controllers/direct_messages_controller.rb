class DirectMessagesController < ApplicationController

    def display_messages 
        @reciever = User.find(params[:second_id])
        @messages = DirectMessage.where(sender_id: session[:user_id]).or(DirectMessage.where(sender_id: params[:second_id]))
    end 
end
