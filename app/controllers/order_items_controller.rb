class OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order = Order.find(@order_item.order_id)
    @order_items = @order.order_items
      @order_item.update_attributes!(order_item_params)
      if @order_items.where.not(making_status: 3 ) == []
        Order.multi_update(order_params)
        redirect_to admins_order_path(@order), notice: "You have updated genre successfully."
      else
        if @order_item.making_status  == "製作中"
          Order.multi_update(order_params)
          redirect_to admins_order_path(@order), notice: "You have updated genre successfully."
        else
          redirect_to admins_order_path(@order), notice: "You have updated genre successfully."
        end
      end

  end
  
  private
    def order_item_params
      params.require(:order_item).permit(:making_status, :order_id)
    end
    def order_params
      params.require(:order_item).permit(orders: :status)[:orders]
    end
end
