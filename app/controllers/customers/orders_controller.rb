class Customers::OrdersController < ApplicationController

  def new
    @customer = Customer.find(params[:customer_id])
    @addresses = Address.where(customer_id: @customer.id)
    @order= Order.new
  end

  def log
    @order= Order.find_by(customer_id: params[:customer_id])
  end

  def index
    @orders= Order.where(customer_id: params[:customer_id])
    @order= Order.find_by(customer_id: params[:customer_id])
    @order_items= OrderItem.where(order_id: @order.id)



  end



  private
  def prder_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
