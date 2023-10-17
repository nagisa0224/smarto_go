class Admin::ShopsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @shops = Shop.page(params[:page]).per(30)
    @shops_all = Shop.all
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
      flash[:notice] = "お店の情報が更新されました！"
      redirect_to admin_shop_path(@shop)
    else
      flash[:alert] = "お店の情報に不備があるため更新ができませんでした"
      render :edit
    end
  end
  
  def search
    @shops = Shop.search(params[:keyword]).page(params[:page]).per(20)
    @type = params[:type]
  end
  
  
  private
  
  def shop_params
    params.require(:shop).permit(:id, :name, :is_admission)
  end
  
end
