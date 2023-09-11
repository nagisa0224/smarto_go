class ReservationDetail < ApplicationRecord
  has_one :item
  has_one :to_go
end
