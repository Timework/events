class User < ApplicationRecord
    has_many :events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
    has_many :attends, foreign_key: "attendee_id"
    has_many :attended_events, through: :attends, source: :attended_event
end
