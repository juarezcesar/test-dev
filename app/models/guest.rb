class Guest < User

    has_many :stays
    has_one :room

    #methods as guest
    def hosted?
        !room.nil?
    end

    def check_in(room, time = Time.now)  
        room.available? and room.owner != self ? room.check_in(self, time) : false
    end  

    def check_out(time = Time.now)
        room.check_out(time) if hosted?
    end
        
end
