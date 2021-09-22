class Customers::RatesController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @item = Item.find(params[:id])
    @rate = Rate.new
    @current_user = current_customer.id
  end
  
  def create
    @rate = Rate.new(rate_params)
    if @rate.save
      redirect_to customers_items_path, notice: "ありがとうございました。"
    else
      redirect_to customers_items_path, notice: "すでに投稿済みです。"
    end

  end
  
  private
    def rate_params
     params.require(:rate).permit(:star,:customer_id,:item_id)
    end


end
