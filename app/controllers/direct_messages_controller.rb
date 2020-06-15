class DirectMessagesController < ApplicationController

    def display_messages 
        @receiver = User.find(params[:second_id])
        @messages = DirectMessage.where(sender_id: session[:user_id]).or(DirectMessage.where(sender_id: params[:second_id]))
    end 

    def create 
        @message = DirectMessage.create(sender_id: session[:user_id], receiver_id: params[:receiver_id], message: params[:message])
       redirect_to request.referrer 
    end 
end
