class UsersController < ApplicationController
    before_action :authenticate, :except => [:new, :create]

    def show 
        #only logged in user have access to this route 
        @user = current_user 
    end 

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.create(user_params)
        if @user.valid?  
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            redirect_to new_user_path 
            flash[:errors] = @user.errors.full_messages 
        end 
    end 


    private 
    def user_params 
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

end
