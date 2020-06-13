class SessionsController < ApplicationController

    def new 
    end 

    #handles user login, accessed from /login
    def create 
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])  #authenticate is rails method provided by adding "has_secure_password" to User model
            session[:user_id] = user.id  #stores authenticated user id in a session 
            redirect_to user_path(user)
        else 
            flash[:alert] = "Invalid Email or Password!"
            redirect_to login_path 
        end 
    end

    # handles user logout, accessed from /logout
    def destroy 
        session[:user_id] = nil 
        redirect_to events_path 
    end


end
