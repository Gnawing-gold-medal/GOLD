class Customers::AddressesController < ApplicationController

  def index
    @addresse = Addresse.new
    @addresse = Addresse.where(customer_id: current_customer.id)
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer
    address.save
    redirect_to request.referer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to new_address
  end

  private
  def address_params
    params.require(:address).permit(:name,:postal_code,:address)
  end
end
