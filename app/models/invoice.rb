class Invoice < ApplicationRecord
  belongs_to :guest
  belongs_to :owner
end
