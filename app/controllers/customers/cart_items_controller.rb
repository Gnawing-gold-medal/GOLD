class Customers::CartItemsController < ApplicationController

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to customers_cart_items_path(@cart_item)
    else
      @cart_item.save
      redirect_to customers_cart_items_path(@cart_item)
    end
  end

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to customers_cart_items_path(@cart_item)
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      redirect_to customers_cart_items_path(@cart_item)
    end
  end

  def cart_destroy
    @cart_items = current_customer.cart_items.all
    if @cart_items.destroy_all
      redirect_to customers_cart_items_path(@cart_items)
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end