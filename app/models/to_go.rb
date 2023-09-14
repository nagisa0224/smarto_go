class ToGo < ApplicationRecord
  has_many :reservation_details
  has_many :items, through: :reservation_details
  belongs_to :shop
  
  #f.fields_forに必要な記述
  accepts_nested_attributes_for :reservation_details
  
  validates :customer_name, presence: true
  
  def self.search(keyword)
    if keyword
      ToGo.where(["customer_name LIKE ?", "%#{keyword}%"])
      #Adminには検索したいテーブル、addressには検索したいカラム名を入力する
    else
      ToGo.all
      #検索結果が当てはまらない場合は全て表示させる（必要ない場合は削除する）
    end
  end
  
  
  #在庫管理
  def decrease_inventory(item_id, item_counts)
    item.with_lock do
      if item.stock >= itemk_counts
        item.update(stock: item.stock - item_counts)
      else
        raise "在庫切れエラー" # 在庫が足りない場合の処理
      end
    end
  end
  
  ActiveRecord::Base.transaction do
  @reservation = Reservation.new(reservation_params)
    if @reservation.save
      decrease_inventory(@reservation.product, @reservation.quantity)
      redirect_to reservations_path
    else
      render :new
    end
  end



  
end
