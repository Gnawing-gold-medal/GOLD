class Customers::ItemsController < ApplicationController

  def top
    @items = Item.all
  end

  def about
  end

  def index
    @items = Item.search(params[:search]).page(params[:page]).per(8)
    @amount = @items.total_count
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
