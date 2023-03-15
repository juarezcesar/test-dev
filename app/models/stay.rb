class Stay < ApplicationRecord

  belongs_to :room
  belongs_to :guest, class_name: "User", foreign_key: "guest_id"
  belongs_to :invoice, optional: true
  belongs_to :room

  validates_presence_of :check_in_time, :check_out_time, :total

  scope :open, -> { where(invoice_id: nil) }
 
  
end
