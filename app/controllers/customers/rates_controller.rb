class Customers::RatesController < ApplicationController
  
  def show
    @item = Item.find(params[:id])
    @rate = Rate.new
  end
  
  def create
    @rate = Rate.new(rate_params)
    @rate.save
      render 'show'

  end
  
  private
    def rate_params
     params.require(:rate).permit(:rate)
    end


end
