class EventUser < ApplicationRecord
    belongs_to :user
    belongs_to :event, counter_cache: :users_count
end
