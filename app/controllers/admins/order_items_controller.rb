class Admins::OrderItemsController < ApplicationController
  def update
    @order_item = Order_item.find(params[:id])
    
    if @order_item.update(order_item_params)
      redirect_to admins_orders_path, notice: "You have updated genre successfully."
    else
      render "edit"
    end
  end
  
  private
    def order_item_params
      params.require(:order_item).permit(:item_id, :customer_id, :amount)
    end
end
