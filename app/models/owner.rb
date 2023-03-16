class Owner < User

    has_many :rooms
    has_many :invoices
    has_many :stays, through: :rooms
    
       
    # methods as owner
    def create_room(name, price = 0)
        room = rooms.new(name: name, price: price)
        room.save!
        return room
    end

    def guest_list
        rooms.busy.map(&:guest)
    end 

    def create_invoices()
        
        invoices = []
        stays_by_guest = stays.unbilled.group_by(&:guest_id)

        stays_by_guest.each_pair do |guest_id, stays|

            invoice = Invoice.create(
                owner: self,
                guest_id: guest_id,
                total: 0
            )

            Stay.where(id: stays.map(&:id), invoice: nil).update_all(invoice_id: invoice.id)

            invoice.total = stays.sum(&:total)
            invoice.save!
            invoices << invoice

        end

        return invoices
    end

    def set_invoice_as_paid(invoice)
        if invoice.owner = self
            invoice.paid = true
            invoice.save
        else
            errors.add(:owner, "Only the owner can set an invoice as paid.") 
            return false
        end

    end
    
end
