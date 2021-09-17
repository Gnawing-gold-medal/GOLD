class Customers::ItemsController < ApplicationController

  def top
    @items = Item.all
  end

  def about
  end

  def index
    @items = Item.search(params[:search])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def search
    @items = Item.search(params[:search])
    @keyword = params[:search]
    render "index"
  end

end
