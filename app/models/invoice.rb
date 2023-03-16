class Invoice < ApplicationRecord
  
  belongs_to :guest
  belongs_to :owner

  scope :paid, -> { where(paid: true) }
  scope :open, -> { where(paid: false) }
 

end
