class Admins::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all.order(params[:sort]).page(params[:page]).per(20)
    @data = [['2019-06-01', @customers.created_6day_ago.count], ['2019-06-02', 200], ['2019-06-03', 150]]
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
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admins_customers_path, notice: "You have updated genre successfully."
    else
      render "edit"
    end
  end
 
  end
  
  private
    def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
    end
  
end
