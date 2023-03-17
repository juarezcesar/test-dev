class Invoice < ApplicationRecord
  
  belongs_to :guest
  belongs_to :owner
  has_many :stays

  scope :paid, -> { where(paid: true) }
  scope :open, -> { where(paid: false) }
 

end
