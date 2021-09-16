class Customers::OrdersController < ApplicationController

  def new
    @customer= Customer.find(params[:customer_id])
    @address= Address.find_by(customer_id: params[:customer_id])
    @addresses= Address.where(customer_id: @customer.id)
    @order= Order.new
  end

  def log
    @customer= Customer.find(params[:customer_id])
    @cart_items= CartItem.where(customer_id: @customer.id)
    total_price= []
    @cart_items.each do |cart_item|
      total_price << (cart_item.item.price * 1.1).round * cart_item.amount
    end
    @total_price= total_price.sum
  end

  def index
    @orders= Order.where(customer_id: params[:customer_id])
    @order= Order.find_by(customer_id: params[:customer_id])
    @order_items= OrderItem.where(order_id: @order.id)
  end

  def show
    @order= Order.find_by(id: params[:id],customer_id: params[:customer_id])
    @order_items= OrderItem.where(order_id: @order.id)
    total_price= []
    @order_items.each do |order_item|
      total_price << order_item.price * order_item.amount
    end
    @total_price= total_price.sum
  end



  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
