class ReservationDetail < ApplicationRecord
  belongs_to :item
  belongs_to :to_go
  
  validates :item_counts, presence: true
  
end
