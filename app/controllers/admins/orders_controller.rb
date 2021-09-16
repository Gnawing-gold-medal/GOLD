class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end
  
  
  
  private
    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
    end
    def order_item_params
      params.require(:order_item).permit(:order_id, :item_id, :price, :amount, :making_status)
    end


end
