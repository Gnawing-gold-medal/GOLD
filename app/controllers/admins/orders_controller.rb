class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(20)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admins_order_path(@order), notice: "You have updated genre successfully."
    else
      render "show"
    end
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
    end
end
