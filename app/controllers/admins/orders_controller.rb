class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.search(params[:method]).page(params[:page]).per(20)
    @data = [[Date.today.ago(6.days), @orders.created_6day_ago.count], 
    [Date.today.ago(5.days), @orders.created_5day_ago.count], 
    [Date.today.ago(4.days), @orders.created_4day_ago.count], 
    [Date.today.ago(3.days), @orders.created_3day_ago.count], 
    [Date.today.ago(2.days), @orders.created_2day_ago.count], 
    [Date.yesterday, @orders.created_yesterday.count], 
    [Date.today, @orders.created_today.count]]
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order_item = OrderItem.find(params[:id])
      @order.update_attributes!(order_params)
      if @order.status == "入金確認"
        OrderItem.multi_update(order_item_params)
        redirect_to admins_order_path(@order), notice: "You have updated genre successfully."
      else
        redirect_to admins_order_path(@order), notice: "You have updated genre successfully."
      end
      
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
    end
    private
    
    def order_item_params
      params.require(:order).permit(order_items: :making_status)[:order_items]
    end
end
