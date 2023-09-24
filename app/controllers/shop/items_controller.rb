class Shop::ItemsController < ApplicationController
  
  before_action :authenticate_shop!
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.shop_id = current_shop.id
    if @item.save
      flash[:notice] = "商品が追加されました！"
      redirect_to item_path(@item.id)
    else
      flash[:alert] = "情報に不備があります"
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
      flash[:notice] = "商品情報が更新されました！"
      redirect_to item_path(@item.id)
    else
      flash[:alert] = "商品情報に不備があるため更新できませんでした"
      render :edit
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:alert] = "商品情報を削除しました"
      redirect_to items_path
    else
      render :edit
    end
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:image, :product_name, :stock, :minimum_stock, :introduction, :is_active)
  end
  
end
