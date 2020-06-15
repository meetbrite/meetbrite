class DirectMessagesController < ApplicationController

    def display_messages 
        @receiver = User.find(params[:second_id])
        @messages = DirectMessage.where(sender_id: session[:user_id], receiver_id: @receiver.id).or(DirectMessage.where(sender_id: @receiver.id, receiver_id: session[:user_id]))
        @direct_id = [@receiver.id, session[:user_id]].sort().join("")

    end 

    def create 
        @message = DirectMessage.create(sender_id: session[:user_id], receiver_id: params[:receiver_id], message: params[:message])

       SendDirectMessageJob.perform_later(@message)
       #redirect_to request.referrer 
    end 
end
