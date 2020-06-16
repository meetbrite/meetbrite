class Event < ApplicationRecord
    has_many :event_user #singularized 
    has_many :users, through: :event_user
    has_many :group_messages

    validates :title, presence: true
    validates :description, presence: true
    validates :city, presence: { message: "is required for in-person event" }, unless: :virtual? 
    validates :state, presence: { message: "is required for in-person event" }, unless: :virtual?
    validates :start, presence: true
    validates :end, presence: true
    validate :end_time_later_than_start
    validate :start_time_must_be_in_future
    # validates :start, numericality: {greater_than: DateTime.now}


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

    #return members of an event 
    def members 
        self.users 
    end 

    # custom validations
    def end_time_later_than_start
        if self.start >= self.end
            self.errors.add(:start, "date/time must be before End date/time")
        end
    end

    # need to fix timezones - DateTime.now uses EST zone
    #  but the db store in UTC 
    def start_time_must_be_in_future
        if self.start <= DateTime.now - 4.hours # to account for the timezone issue
            self.errors.add(:event,  "must be in the future")
        end
    end

end
