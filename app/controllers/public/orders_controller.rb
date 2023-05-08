class Public::OrdersController < ApplicationController

def new
  @customer = current_customer
  @orders = current_customer.orders.new
end

def confirm
  @order = Order.find(params[:id])
  @order.cpunt = Order.all.count
  @total = @order_details.inject(0) { |sum, order| sum + order.sum_of_price }
end

def completion
  @customer = current_customer
end

def create
  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
  if @order.save!
    redirect_to orders_confirm_path
  else
    render "new"
  end
end

def index
  @customer = current_customer
  @orders = current_customer.orders.all
end

def show
  @order = Order.find(params[:id])
  @order_details = @order.order_detail
  @total = @order_details.inject(0) { |sum, order| sum + order.sum_of_price }
end

private

def order_params
   params.require(:order).permit(:postal_code, :address, :name, :payment_method, :postage, :billing_amount)
end

end
