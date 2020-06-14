class ApplicationController < ActionController::Base
    helper_method :current_user, :authenticate

    def current_user
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        else
            @current_user = nil 
        end
    end 

    def authenticate 
        if current_user 
            true 
        else 
             redirect_to login_path  
        end 
    end 
end
