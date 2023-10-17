class ToGo < ApplicationRecord
  has_many :reservation_details, inverse_of: :to_go, dependent: :destroy
  accepts_nested_attributes_for :reservation_details, allow_destroy: true
  has_many :items, through: :reservation_details
  belongs_to :shop
  #validates_associated :reservation_details
  
  
  #f.fields_forに必要な記述
  accepts_nested_attributes_for :reservation_details, reject_if: :all_blank, allow_destroy: true
  
  validates :customer_name, presence: true
  validates :date, presence: true
  
  
  def self.search(keyword)
    if keyword
      ToGo.where(["customer_name LIKE ?", "%#{keyword}%"])
    else
      ToGo.all
      #検索結果が当てはまらない場合は全て表示させる（必要ない場合は削除する）
    end
  end
  
  
  def self.history_search(keyword)
    if keyword
      ToGo.where(["customer_name LIKE ?", "%#{keyword}%"])
    else
      ToGo.all
      #検索結果が当てはまらない場合は全て表示させる（必要ない場合は削除する）
    end
  end
  
  
  def save_and_decrease_stock
    ActiveRecord::Base.transaction do
      save!
      #itemの在庫を減らす
      reservation_details.each do |rd|
        item = rd.item
        #.with_lock　同時にアクセスするのを防ぐ（一人ずつ処理するために一回ロックする）
        item.with_lock do
          if item.stock >= rd.item_counts
            item.update!(stock: item.stock - rd.item_counts)
          else
            raise "在庫切れエラー" # 在庫が足りない場合の処理
          end
        end
      end
    end
  rescue ActiveRecord::RecordInvalid
    false
  rescue => e
    errors.add(:base, e.message)
    false
  end
  
  
  scope :future_reservations, -> { where('time < ?', Time.now) }


  
end
