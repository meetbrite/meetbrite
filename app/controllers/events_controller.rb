class EventsController < ApplicationController
    before_action :authenticate, :except => [:index, :show] #unregistered users can only see index of the events route

    def index
        @events = Event.where(public: true)
        @user = current_user
        # @joined = @event.is_user_joined(@user) #returns true if user has joined event
    end

    def show
        @event = Event.find(params[:id])
        @user = current_user 
        @joined = @event.is_user_joined(@user) #returns true if user has joined event
        @organizer = @event.is_user_organizer(@user) #returns true if user is an organzier
    end

    def new
        @event = Event.new()
    end

    def create
        @event = Event.create(event_params) #create an event 
        EventUser.create(user_id: session[:user_id], event_id: @event.id, organizer: true) #creates assoication between creater(user) and event
        redirect_to event_path(@event)
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update 
        @event = Event.find(params[:id])
        @event.update(event_params)

        redirect_to event_path(@event)
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

    private

    def event_params
        params.require(:event).permit(:title, :description, :location, :start, :end, :active, :public)
    end
end
