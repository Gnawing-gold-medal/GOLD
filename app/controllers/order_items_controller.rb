class OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    
    if @order_item.update(order_item_params)
      redirect_to admins_order_path(@order_item.order), notice: "You have updated genre successfully."
    else
      render "show"
    end
  end
  
  private
    def order_item_params
      params.require(:order_item).permit(:making_status)
    end
end
