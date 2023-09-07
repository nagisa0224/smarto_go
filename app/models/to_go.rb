class ToGo < ApplicationRecord
  has_many :reservation_details
  belongs_to :shop
  
  validates :customer_name, presence: true
  
end
