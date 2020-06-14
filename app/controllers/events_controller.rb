class EventsController < ApplicationController

    def index
        @events = Event.where(public: true)
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
        @event = Event.create(event_params)

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

    private

    def event_params
        params.require(:event).permit(:title, :description, :location, :start, :end, :active, :public)
    end
end
