class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
end
