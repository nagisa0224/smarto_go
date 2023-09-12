class ToGo < ApplicationRecord
  has_many :reservation_details
  has_many :items, through: :reservation_details
  belongs_to :shop
  
  #f.fields_forに必要な記述
  accepts_nested_attributes_for :reservation_details
  
  validates :customer_name, presence: true
  
end
