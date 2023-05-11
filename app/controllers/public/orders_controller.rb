class Public::OrdersController < ApplicationController

def new
  @customer = current_customer
  @orders = current_customer.orders.new
end

def confirm
  @postage = 800
  @order = Order.new(order_params)
  if params[:order][:address_id] == '0'
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

  end

  @customer = current_customer
  @cart_items = current_customer.cart_items.all
  @order_count = Order.all.count
  @total = (@cart_items.inject(0) { |sum, cart_items| sum + cart_items.subtotal }) + @postage
  # @total = 0
end

def completion
  @customer = current_customer
end

def create

  @order = Order.new(order_params)
  @order.customer_id = current_customer.id
  # binding.pry
  @order.save!
  current_customer.cart_items.each do |cart_item|
    order_detail = OrderDetail.new
    order_detail.amount = cart_item.amount
    order_detail.item_id = cart_item.item_id
    order_detail.order_id = @order.id
    order_detail.purchase_price = cart_item.item.price * 1.1
    order_detail.save
  end
  current_customer.cart_items.destroy_all
  redirect_to orders_completion_path
end

def index
  @customer = current_customer
  @orders = current_customer.orders.all
end

def show
  @customer = current_customer
  @order = Order.find(params[:id])
  @order_details = @order.order_details
  @total = @order_details.inject(0) { |sum, order| sum + order.purchase_price }
end

private

def order_params
  params.require(:order).permit(:postal_code, :address, :name, :payment_method, :postage, :billing_amount)
end


end
