class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render "edit"
    end
  end

  def cancellation
    @customer = Customer.find(current_customer.id)
  end

  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.destroy
    redirect_to customers_cancellation_path
  end

 private
  def customer_params
     params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana,  :postal_code, :address, :telephone_number)
  end

end
