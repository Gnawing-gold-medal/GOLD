class Customers::OrdersController < ApplicationController

  def new
    @customer = Customer.find(params[:customer_id])
    @addresses = Address.where(customer_id: @customer.id)
    @order= Order.new
  end

  def log
    @order= Order.find_by(customer_id: params[:customer_id])
  end

  private
  def prder_params
    params.require(:order).permit()
  end

end
