class User < ApplicationRecord
    has_many :event_user #plural gave an error 
    has_many :group_messages
    has_many :events, through: :event_user
    

    has_many :direct_messaged, foreign_key: :receiver_id, class_name: 'DirectMessage'  #user can message many users.  The messaged users are accessed by the reciever_id
	has_many :senders, through: :direct_messaged
	has_many :direct_messagee, foreign_key: :sender_id, class_name: 'DirectMessage'
    has_many :receivers, through: :direct_messagee
    
    has_secure_password 
    validates :email, presence: true, uniqueness: true

end
