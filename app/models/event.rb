class Event < ApplicationRecord
    has_many :users, through: :event_user
    has_many :event_users
    has_many :group_messages

    validates :title, presence: true
    validates :description, presence: true
    validates :city, presence: { message: "is required for in-person event" }, unless: :virtual? 
    validates :state, presence: { message: "is required for in-person event" }, unless: :virtual?
    validates :start, presence: true
    validates :end, presence: true

    #returns true if user has already joined the event 
    def is_user_joined(user)
        if user 
            event_user = EventUser.find_by(event_id: self.id, user_id: user.id)
            event_user ? true : false 
        else 
            false 
        end

    end 

    #returns true if user is an organizer 
    def is_user_organizer(user)
        if user 
            event_user = EventUser.find_by(event_id: self.id, user_id: user.id)
            event_user ? event_user.organizer : false
        else 
            false 
        end 
    end 

end
