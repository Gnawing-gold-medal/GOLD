class Customers::ItemsController < ApplicationController

  def top
    @items = Item.all
    @all_ranks = Item.find(OrderItem.group(:item_id).order('count(item_id) desc').limit(4).pluck(:item_id))
  end

  def about
  end

  def index
    @items = Item.search(params[:search]).page(params[:page]).per(8)
    @amount = Item.count
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
