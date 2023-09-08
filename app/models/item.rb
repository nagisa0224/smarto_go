class Item < ApplicationRecord
    
    has_many :reservation_details
    has_one :notifications
    belongs_to :shop
    has_one_attached :image
    
    def item_status
        if is_active == true
            "販売中"
        else
            "販売停止中"
        end
    end
    
    
end
