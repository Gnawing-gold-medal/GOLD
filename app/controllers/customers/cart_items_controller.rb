class Customers::CartItemsController < ApplicationController
  before_action :authenticate_customer!,except: [:create]

  def create
    if customer_signed_in?
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
        cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        cart_item.amount += params[:cart_item][:amount].to_i
        cart_item.save
        flash[:notice] = "#{@cart_item.item.name}の数量を変更しました"
        redirect_to customers_cart_items_path(@cart_item)
      else
        @cart_item.save
        flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
        redirect_to customers_cart_items_path(@cart_item)
      end
    else
      redirect_to customer_session_path
    end
  end

  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "#{@cart_item.item.name}の数量を変更しました"
      redirect_to customers_cart_items_path(@cart_item)
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      flash[:notice] = "#{@cart_item.item.name}をカートから削除しました"
      redirect_to customers_cart_items_path
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