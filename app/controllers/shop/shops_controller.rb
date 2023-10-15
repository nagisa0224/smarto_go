class Shop::ShopsController < ApplicationController
  
  before_action :authenticate_shop!
  
  def show
    @shop = current_shop
    # 自身のショップのアイテムのみ、かつ、最低在庫を下回っているアイテムを取得
    @nor_items = Item.where(shop_id: current_shop.id).where('stock < minimum_stock')
  end
  
  def edit
    @shop = current_shop
  end
  
  def update
    @shop = current_shop
    if @shop.update(shop_params)
      flash[:notice] = "お店の情報が更新されました！"
      redirect_to shops_my_page_path
    else
      flash[:alert] = "お店の情報に不備があるため更新ができませんでした"
      render :edit
    end
  end
  
  def confirm_withdraw
    
  end
  
  def withdraw
    @shop = current_shop
    @shop.update(is_admission: false)
    reset_session
    flash[:destroy] = "退会手続きが正常に完了しました。あなたとまたお会いできることを願っています！"
    redirect_to root_path
  end
  
  
  private
  
  def shop_params
    params.require(:shop).permit(:name, :email)
  end
  
end
