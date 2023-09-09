class Shop::ShopsController < ApplicationController
  
  def show
    @shop = current_shop
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
