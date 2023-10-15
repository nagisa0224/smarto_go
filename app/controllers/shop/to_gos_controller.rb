class Shop::ToGosController < ApplicationController
  
  before_action :authenticate_shop!
  
  def new
    @to_go = ToGo.new
    @reservation_detail = @to_go.reservation_details.build
    @items = Item.all
  end
  
  
  def create
    @to_go = ToGo.new(to_go_params)
    @to_go.shop_id = current_shop.id
    if @to_go.save_and_decrease_stock
      flash[:notice] = "予約が作成されました！"
      redirect_to to_go_path(@to_go.id)
    else
      flash[:alert] = "作成に不備があります"
      render :new
    end
  end
  
  
  def index
    @to_gos = ToGo.where(shop_id: current_shop.id).where('date >= ?', Date.current).order(:date).page(params[:page]).per(20)
    @to_gos_all = ToGo.all
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
      flash[:notice] = "予約情報が更新されました！"
      redirect_to to_go_path(@to_go.id)
    else
      flash[:alert] = "予約情報の不備があるため更新ができませんでした"
      render :edit
    end
  end
  
  
  def destroy
    @to_go = ToGo.find(params[:id])
    if @to_go.destroy
      flash[:alert] = "予約が削除されました"
      redirect_to to_gos_path
    else
      render :edit
    end
  end
  
  
  #予約履歴に関するコントローラー
  def history
    @to_gos = ToGo.page(params[:page]).per(20)
    @to_gos_all = ToGo.all
  end
  
  
  def history_show
    @to_go = ToGo.find(params[:id])
    @to_go.shop_id = current_shop.id
  end
  
  
  #検索に関するコントローラー
  def search
    @to_gos = ToGo.where(shop_id: current_shop.id).where('date >= ?', Date.current).order(:date).search(params[:keyword]).page(params[:page]).per(20)
    @type = params[:type]
  end
  
  
  #to_go indexチェックボタンの切り替え
  def change_status
    to_go = ToGo.find(params[:id])
    to_go.update(:status => !to_go.status)
      redirect_back fallback_location: root_path
  end


  
  
  private
  
  def to_go_params
    params.require(:to_go).permit(:customer_name, :address, :date, :time, :body, reservation_details_attributes: [:id, :item_counts, :item_id, :_destroy])
  end
  

end
