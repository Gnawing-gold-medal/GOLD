class Customers::ItemsController < ApplicationController

  def top
    @items = Item.all
    @all_ranks = Item.find(OrderItem.group(:item_id).order('count(item_id) desc').limit(4).pluck(:item_id))
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
    @genres = Genre.all
    
    if customer_signed_in?
      unless Count.find_by(customer_id: current_customer.id, item_id: @item.id)
        current_customer.counts.create(item_id: @item.id)
      end
    else
    end
    
  end

end
