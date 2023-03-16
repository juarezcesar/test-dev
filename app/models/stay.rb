class Stay < ApplicationRecord

  belongs_to :room
  belongs_to :guest, class_name: "User", foreign_key: "guest_id"
  belongs_to :invoice, optional: true
  belongs_to :room

  validates_presence_of :check_in_time, :check_out_time, :total

  #Stays not associate with an invoice to be charged
  scope :unbilled, -> { where(invoice_id: nil) }
  scope :billed, -> { where.not(invoice_id: nil) }

  def time
    ((self.check_out_time - self.check_in_time) / 1.minutes).to_i
  end
 
  
end
