class ReservationDetail < ApplicationRecord
  belongs_to :item
  belongs_to :to_go
  
  validates :item_counts, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
end
