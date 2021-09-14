class Customers::CustomersController < ApplicationController

  def show
    @customer = Customer.find(params[:id])
  end

  def leave_page
    @customer = Customer.find(params[:id])
  end

  def leave
    customer = Customer.find(params[:id])
    customer.update(is_deleted: true)
    redirect_to root_path
  end

end
