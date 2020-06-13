class UsersController < ApplicationController
    before_action :authenticate, :except => [ :new]

    def show 
        #only logged in user have access to this route 
        @user = User.find(params[:id])
    end 

    def new 
        
    end 
end
