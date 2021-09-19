class Admins::CustomersController < ApplicationController
  
  def index
    @customers = Customer.all.order(params[:sort]).page(params[:page]).per(20)
    @data = [[Date.today.ago(6.days), @customers.created_6day_ago.count], 
    [Date.today.ago(5.days), @customers.created_5day_ago.count], 
    [Date.today.ago(4.days), @customers.created_4day_ago.count], 
    [Date.today.ago(3.days), @customers.created_3day_ago.count], 
    [Date.today.ago(2.days), @customers.created_2day_ago.count], 
    [Date.yesterday, @customers.created_yesterday.count], 
    [Date.today, @customers.created_today.count]]
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
