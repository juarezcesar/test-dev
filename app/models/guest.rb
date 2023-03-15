class Guest < User

    has_many :stays, foreign_key: "guest_id"
    has_one :hosted_at, class_name: "Room", foreign_key: "guest_id"

    #methods as guest
    def hosted?
        !hosted_at.nil?
    end

    def check_in(room, time = Time.now)  
        room.available? and room.owner != self ? room.check_in(self, time) : false
    end  

    def check_out(time = Time.now)
        hosted_at.check_out(time) if hosted?
    end
        
end
