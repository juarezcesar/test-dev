class Room < ApplicationRecord

  belongs_to :owner
  belongs_to :guest, optional: true
  has_many :stays
  
  validates :name, presence: true
  validates :owner_id, presence: true
  validate :guest_cannot_be_the_owner

  scope :available, -> { where(guest_id: nil) }
  scope :busy, -> { where.not(guest_id: nil) }
 
  def available?
    guest_id.nil?
  end

  def busy?
    !guest.nil?
  end

  def check_in(guest, check_in_time = Time.now)
    self.guest = guest
    self.check_in_time =  check_in_time
    self.save
  end
  
  def check_out(check_out_time = Time.now)
    if busy? 
      register_stay(check_out_time)
      free_room()
    else
      raise Exception, 'You'
    end
  end

  def calculate_total(checkout = Time.now)
    minutes = ((checkout - self.check_in_time) / 1.minutes).to_i
    return minutes*self.price    
  end

  private

  def guest_cannot_be_the_owner
    errors.add(:guest_id, "cannot be the same as the owner.") if self.guest_id == self.owner_id
  end

  def free_room
    self.guest = nil
    self.check_in_time = nil
    self.save
  end

  def register_stay(check_out_time = Time.now )
    stays.new(
      guest: self.guest,
      check_in_time: self.check_in_time, 
      check_out_time:  check_out_time,
      total: calculate_total(),
    ).save!
  end


  
end
