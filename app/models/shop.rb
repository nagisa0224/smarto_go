class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :to_gos
  has_many :items
  
  validates :email, uniqueness: { message: I18n.t("errors.exist") }
  
  
  

end
