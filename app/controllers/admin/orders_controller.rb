class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_detail
    @total = @order_details.inject(0) { |sum, order| sum + order.sum_of_price }
  end

  private

  def order_details_params
    params.require(:order_details).permit(:purchase_price, :amount, :production_status)
  end
end