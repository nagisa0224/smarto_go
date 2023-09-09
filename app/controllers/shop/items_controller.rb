class Shop::ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.shop_id = current_shop.id
    if @item.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @item.shop_id = current_shop.id
  end
  
  def edit
    @item = Item.find(params[:id])
    @item.shop_id = current_shop.id
  end
  
  #今回update重複しません！
  def update
    @item = Item.find(params[:id])
    @item.shop_id = current_shop.id
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
  
  def destroy
    
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:image, :product_name, :stock, :minimum_stock, :introduction, :is_active)
  end
  
end
