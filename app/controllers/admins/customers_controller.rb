class Admins::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
    if @customer.user_status == false
      @status = "有効"
    else
      v = "無効"
    end
 
  end
  
  private
    def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
    end
  
end
