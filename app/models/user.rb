class User < ApplicationRecord

    validates :name, presence: true

    # As a owner
    has_many :rooms, foreign_key: "owner_id"
    has_many :invoices, foreign_key: "owner_id"
    
    # As a guest
    has_many :stays, foreign_key: "guest_id"
    has_one :hosted_at, class_name: "Room", foreign_key: "guest_id"

       
    # methods as owner
    def create_room(name, price = 0)
        rooms.new(name: name, price: 0)
    end

    def guest_list
        rooms.busy.map(&:guest)
    end 

    #methods as guest
    def hosted?
        !hosted_at.nil?
    end

    def check_in(room, time = Time.now)         
        room.check_in(self, time) if !hosted?         
    end  

    def check_out(time = Time.now)
        hosted_at.check_out(time) if hosted?
    end
end
