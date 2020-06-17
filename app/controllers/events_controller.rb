class EventsController < ApplicationController
    before_action :authenticate, :except => [:index, :show, :search] #unregistered users can only see index of the events route

    def index
        @events = Event.where("public = ? AND end > ?", true, DateTime.now - 4.hours)
        @user = current_user
        @search_entry = nil
    end

    def show
        @event = Event.find(params[:id])
        @user = current_user 
        @joined = @event.is_user_joined(@user) #returns true if user has joined event
        @organizer = @event.is_user_organizer(@user) #returns true if user is an organzier

   #if event is private, restrict access to organizer and enrolled users only 
   
        if !@event.public && !@organizer && !@joined  
            redirect_back(fallback_location: events_path)
        end 
    end

    def new
        @event = Event.new()
    end

    def create
        @event = Event.create(event_params) #create an event 
        if @event.valid?
            EventUser.create(user_id: session[:user_id], event_id: @event.id, organizer: true) #creates assoication between creater(user) and event
            redirect_to event_path(@event)
        else 
            flash[:errors] = @event.errors.full_messages 
            redirect_to new_event_path

        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update 
        @event = Event.find(params[:id])
        @event.update(event_params)

        if @event.valid?
            redirect_to event_path(@event)
        else 
            flash[:errors] = @event.errors.full_messages 
            flash[:errors].unshift "Your event was not updated:"
            redirect_to edit_event_path
        end

    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        redirect_to events_path
    end

    #Lets user join an event 
    def register 
        event = Event.find(params[:event_id])  #is it necessary to find the event? can't we just use the id from params
        EventUser.create(user_id: session[:user_id], event_id: event.id, organizer: false)
        redirect_to user_path(session[:user_id])
    end

    #Lets user leave an event 
    def unregister 
        event_user = EventUser.find_by(user_id: session[:user_id], event_id: params[:event_id])
        event_user.destroy
        redirect_to user_path(session[:user_id])
    end

    def search 
       if params[:events][:attr] == ""
            @events = Event.where(public: true)
            @user = current_user
       else 
            #@events = Event.where("title LIKE :title AND public  :public", { title: "%#{params[:events][:attr]}%", public: "%#{true}%"  })
            #@events = Event.where("title LIKE ? AND public LIKE ?", "%#{params[:events][:attr]}%", "true" )
            @events = Event.where("title LIKE ?", "%#{params[:events][:attr]}%") # How can we add an additional condition to return public events only 
            @user = current_user
            @search_entry = params[:events][:attr]
       end 
      
       render :index 
    end 


    def organizer
        @user = current_user
        @events = @user.organized_events 
    end 

    #Lets user join an event 
    def add_member 
        event = Event.find(params[:event_id])  #is it necessary to find the event? can't we just use the id from params
        user = User.find_by(email: params[:events][:email])
        if user  
            if !event.is_user_joined(user)
                EventUser.create(user_id: user.id, event_id: event.id, organizer: false)
                redirect_back(fallback_location: user_path(session[:user_id]))
            else 
                flash[:error] = "User already joined!"
            end 
        else 
            flash[:error] = "User doesn't exist "
            redirect_back(fallback_location: user_path(session[:user_id]))
        end 
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :location_name, :street_address, :city, :state, :zipcode, :start, :end, :active, :public, :virtual)
    end
end
