class User < ApplicationRecord
    has_many :event_user #plural gave an error 
    has_many :group_messages
    has_many :events, through: :event_user
    

    has_many :direct_messagee, foreign_key: :receiver_id, class_name: 'DirectMessage'  
	has_many :senders, through: :direct_messagee
	has_many :direct_messaged, foreign_key: :sender_id, class_name: 'DirectMessage' #user can message many users.  The messaged users are accessed by the reciever_id
    has_many :receivers, through: :direct_messaged
    
    has_secure_password 
    validates :email, presence: true, uniqueness: true


    #this may better be in DirectMessage 
    def people_messaged
        #DirectMessage.where(sender_id: self.id).or(DirectMessage.where(reciever_id: self.id)).distinct
        #DirectMessage.where(reciever_id: self.id).distinct
        DirectMessage.all.select {|m| m.receiver_id == self.id}.uniq {|i| i.sender_id} #retuns a list of direct messages, unique by sender_id 
    end 


        #return all events of an organizer 
    # def organized_events 
    #     event_users = EventUser.where(user_id: self.id, organizer: true)
    #     event_users.map do |event_user|
    #         event_user.event
    #     end 
    # end 

end
