class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  def shop_status
        if is_admission == true
            "稼働中"
        else
            "退会済"
        end
  end
  
  def self.search(keyword)
    if keyword
      Shop.where(["name LIKE ?", "%#{keyword}%"])
    else
      Shop.all
      #検索結果が当てはまらない場合は全て表示させる（必要ない場合は削除する）
    end
  end
  
end
