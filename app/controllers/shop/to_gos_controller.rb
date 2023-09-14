class Shop::ToGosController < ApplicationController
  
  def new
    @to_go = ToGo.new
    @items = Item.all
  end
  
  
  def create
    @to_go = ToGo.new(to_go_params)
    @to_go.shop_id = current_shop.id
    if @to_go.save_and_decrease_stock
      redirect_to to_go_path(@to_go.id)
    else
      render :new
    end
  end
  
  
  def index
    @to_gos = ToGo.all
  end
  
  
  def show
    @to_go = ToGo.find(params[:id])
    @to_go.shop_id = current_shop.id
  end
  
  
  def edit
    @to_go = ToGo.find(params[:id])
    @to_go.shop_id = current_shop.id
    @items = Item.all
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
  
  
  #予約履歴に関するコントローラー
  def history
    @to_gos = ToGo.all
  end
  
  
  def history_show
    @to_go = ToGo.find(params[:id])
    @to_go.shop_id = current_shop.id
  end
  
  
  #検索に関するコントローラー
  def search
    @to_gos = ToGo.search(params[:keyword])
    #@teamsは好きなものを入力して、Adminの部分には検索したいテーブル名を入力する
  end

  
  
  private
  
  def to_go_params
    params.require(:to_go).permit(:customer_name, :address, :date, :time, :body, reservation_details_attributes: [:id, :item_counts, :item_id, :_destroy])
  end
  

end
