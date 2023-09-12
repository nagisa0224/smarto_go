class ReservationDetail < ApplicationRecord
  belongs_to :item
  belongs_to :to_go
end
