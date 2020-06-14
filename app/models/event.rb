class Event < ApplicationRecord
    has_many :users, through: :event_user
    has_many :event_users
    has_many :group_messages

    #returns true if user has already joined the event 
    def is_user_joined(user)
        event_user = EventUser.find_by(event_id: self.id, user_id: user.id)
        event_user ? true : false 
    end 

    #returns true if user is an organizer 
    def is_user_organizer(user)
        event_user = EventUser.find_by(event_id: self.id, user_id: user.id)
        event_user.organizer 
    end 

end
