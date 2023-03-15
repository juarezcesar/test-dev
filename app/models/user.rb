class User < ApplicationRecord

  validates :name, presence: true

  def as_owner
    if self.id
      Owner.find(self.id)
    else
      raise "User cannot act as a Owner before being saved" 
    end
  end

  def as_guest
    if self.id
      Guest.find(self.id)
    else
      raise "User cannot act as a Guest before being saved" 
    end
  end
    

end
