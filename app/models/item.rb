class Item < ApplicationRecord
    
    has_many :reservation_details
    has_many :to_gos, through: :reservation_details
    belongs_to :shop
    has_one_attached :image
    
    validates :product_name, presence: true
    
    def item_status
        if is_active == true
            "販売中"
        else
            "販売停止中"
        end
    end
    
    def get_image(width, height)
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.png')
        image.attach(io: File.open(file_path), filename: 'no_image.png', content_type: 'image/png')
      end
      image.variant(resize_to_limit: [width, height]).processed
    end

    
    
end
