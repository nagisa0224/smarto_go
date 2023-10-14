# frozen_string_literal: true

class Shop::SessionsController < Devise::SessionsController
  before_action :reject_shop, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def after_sign_in_path_for(resource)
    @shop = current_shop
    to_gos_path
  end
  
  def reject_shop
    @shop = Shop.find_by(email: params[:shop][:email])
    if @shop
      if @shop.valid_password?(params[:shop][:password]) && (@shop.is_admission == false)
        #フラッシュメッセージ
        flash[:alert] = "すでに退会しているためログインできません"
        redirect_to new_shop_registration_path
      end
    end
  end
  
end
