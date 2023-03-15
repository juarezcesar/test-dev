class Owner < User

    has_many :rooms, foreign_key: "owner_id"
    has_many :invoices, foreign_key: "owner_id"
    
       
    # methods as owner
    def create_room(name, price = 0)
        room = rooms.new(name: name, price: 0)
        room.save!
        return room
    end

    def guest_list
        rooms.busy.map(&:guest)
    end 
    
end
