class Item < ApplicationRecord
    
    has_many :reservation_details
    has_one :notification
    belongs_to :shop
    has_one_attached :image
    
    def item_status
        if is_active == true
            "販売中"
        else
            "販売停止中"
        end
    end
    
    def get_image(width, height)
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/no_image.jpg')
          image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
        end
        image.variant(resize_to_limit: [width, height]).processed
    end
    
end
