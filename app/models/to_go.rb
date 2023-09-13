class ToGo < ApplicationRecord
  has_many :reservation_details
  has_many :items, through: :reservation_details
  belongs_to :shop
  
  #f.fields_forに必要な記述
  accepts_nested_attributes_for :reservation_details
  
  validates :customer_name, presence: true
  
  def self.search(search)
    if search
      ToGo.where(['customer_name LIKE ?', "%#{search}%"])
      #Adminには検索したいテーブル、addressには検索したいカラム名を入力する
    else
      ToGo.all
      #検索結果が当てはまらない場合は全て表示させる（必要ない場合は削除する）
    end
  end

  
end
