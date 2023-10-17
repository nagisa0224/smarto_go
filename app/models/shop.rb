class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :to_gos
  has_many :items
  
  validates :name, presence: true
  validates :email, presence: true

  
  def self.search(keyword)
    if keyword
      Shop.where(["name LIKE ?", "%#{keyword}%"])
    else
      Shop.all
      #検索結果が当てはまらない場合は全て表示させる（必要ない場合は削除する）
    end
  end
  

end
