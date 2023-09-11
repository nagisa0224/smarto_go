class ToGo < ApplicationRecord
  has_many :reservation_details
  has_many :items, through: :reservation_details
  belongs_to :shop
  
  validates :customer_name, presence: true
  
end
