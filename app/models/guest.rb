class Guest < User

    has_many :stays
    has_one :room

    def hosted?
        room.present?
    end

    def rooms_available
        Room.available.where.not(owner: self )
    end

    def check_in(room, time = Time.now)  
        if room.available? and !hosted? and room.owner_id != self.id 
            room.check_in(self, time)
        else
            false
        end
    end  

    def check_out(time = Time.now)
        room.check_out(time) if hosted?
    end
        
end
