class ToGo < ApplicationRecord
  has_many :reservation_details
  belongs_to :shop
  
  validates :name, presence: true
  
end
