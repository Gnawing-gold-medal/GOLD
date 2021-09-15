class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
    if @customer.is_deleted == false
      @status = "有効"
    else
      @status = "退会"
    end
    
  def edit
    @customer = Customer.find(params[:id])
  end
 
  end
  
  private
    def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
    end
  
end
