class Customers::CartItemsController < ApplicationController

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to customers_cart_items_path(@cart_item)
    end
  end

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update

  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
      redirect_to customers_cart_items_path(@cart_item)
    end
  end

  def cart_destroy

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end