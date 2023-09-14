class Admin::ShopsController < ApplicationController
  
  def index
    @shops = Shop.all
  end
  
  def show
    @shop = Shop.find(params[:id])
  end
  
  def edit
    @shop = Shop.find(params[:id])
  end
  
  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to admin_shop_path(@shop)
    else
      render :edit
    end
  end
  
  
  private
  
  def shop_params
    params.require(:shop).permit(:id, :name, :is_admission)
  end
  
end