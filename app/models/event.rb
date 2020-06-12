class Event < ApplicationRecord
    has_many :users, through: :event_user
    has_many :event_users
    has_many :group_messages

end
