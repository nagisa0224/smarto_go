class Shop::ShopsController < ApplicationController
  
  before_action :authenticate_shop!
  
  def show
    @shop = current_shop
    # @nor_items = Items.where(shop_id: current_shop.id, notification: true)
    
    # 自身のショップのアイテムのみ、かつ、最低在庫を下回っているアイテムを取得
    @nor_items = Item.where(shop_id: current_shop.id).where('stock < minimum_stock')
  end
  
  def edit
    @shop = current_shop
  end
  
  def update
    @shop = current_shop
    if @shop.update(shop_params)
      redirect_to shops_my_page_path
    else
      render :edit
    end
  end
  
  def confirm_withdraw
    
  end
  
  def withdraw
    @shop = current_shop
    @shop.update(is_admission: true)
    reset_session
    redirect_to root_path
  end
  
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :email)
  end
  
end
