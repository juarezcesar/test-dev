class Owner < User

    has_many :rooms
    has_many :invoices
    has_many :stays, through: :rooms
    
       
    # methods as owner
    def create_room(name, price = 0)
        room = rooms.new(name: name, price: 0)
        room.save!
        return room
    end

    def guest_list
        rooms.busy.map(&:guest)
    end 

    def create_invoices()
        total = 0  
        invoice = Invoice.new(
            owner: self,
            guest: self.guest,
            total: 0
        )
        stays.each do |s|
            unless stay.charged?
                invoice.stays << stay
                invoice.total += stay.total               
            end
        end
        invoice.save! unless invoice.stays.count == 0
    end
    
end
