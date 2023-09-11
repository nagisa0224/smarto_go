class Shop::ToGosController < ApplicationController
  
  def new
    @to_go = ToGo.new
    @items = Item.all
  end
  
  def create
    @to_go = ToGo.new(to_go_params)
    @to_go.shop_id = current_shop.id
    if @to_go.save
      redirect_to to_go_path(@to_go.id)
    else
      render :new
    end
  end
  
  def index
    @to_gos = ToGo.all
    # 検索オブジェクト
    #@search = ToGo.ransack(params[:q])
    # 検索結果
    #@togos = @search.result
  end
  
  def show
    @to_go = ToGo.find(params[:id])
    @to_go.shop_id = current_shop.id
  end
  
  def edit
    @to_go = ToGo.find(params[:id])
    @to_go.shop_id = current_shop.id
  end
  
  def update
    @to_go = ToGo.find(params[:id])
    @to_go.shop_id = current_shop.id
    if @to_go.update(to_go_params)
      redirect_to to_go_path(@to_go.id)
    else
      render :edit
    end
  end
  
  def destroy
    @to_go = ToGo.find(params[:id])
    if @to_go.destroy
      redirect_to to_gos_path
    else
      render :edit
    end
  end
  
  def history
    @to_gos = ToGo.all
  end
  
  def history_show
    @to_go = ToGo.find(params[:id])
    @to_go.shop_id = current_shop.id
  end
  
  
  
  private
  
  def to_go_params
    params.require(:to_go).permit(:customer_name, :address, :date, :time, :body)
  end
  
end
