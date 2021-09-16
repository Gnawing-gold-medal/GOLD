class Customers::OrdersController < ApplicationController

  def new
    @customer= Customer.find(params[:customer_id])
    @address= Address.find_by(customer_id: params[:customer_id])
    @addresses= Address.where(customer_id: @customer.id)
    @order= Order.new
  end

  def log
    @customer= Customer.find(params[:customer_id])
    @addresses= Address.where(customer_id: @customer.id)
    @cart_items= CartItem.where(customer_id: @customer.id)
    total_price= []
    @cart_items.each do |cart_item|
      total_price << (cart_item.item.price * 1.1).round * cart_item.amount
    end
    @total_price= total_price.sum
    @total_payment= @total_price + 800

    @order= Order.new(order_params)
    if params[:order][:address_select] == "0"
       @order_postal_code= @customer.postal_code
       @order_address= @customer.address
       @order_name= @customer.last_name + @customer.first_name
    elsif params[:order][:address_select] == "1"
       @order_postal_code = Address.find_by(id: params[:order][:oter_address], customer_id: @customer.id).postal_code
       @order_address = Address.find_by(id: params[:order][:oter_address], customer_id: @customer.id).address
       @order_name = Address.find_by(id: params[:order][:oter_address], customer_id: @customer.id).name
    elsif params[:order][:address_select] == "2"
       @order_postal_code= @order.postal_code
       @order_address= @order.address
       @order_name= @order.name
    end

  end

  def create
    order= Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    redirect_to thanks_customers_customer_orders_path(current_customer.id)
  end

  def thanks
  end


  def index
    @orders= Order.where(customer_id: params[:customer_id])
    @order= Order.find_by(customer_id: params[:customer_id])
    @order_items= OrderItem.where(order_id: @order.id)
  end

  def show
    @order= Order.find_by(customer_id: params[:customer_id])
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
