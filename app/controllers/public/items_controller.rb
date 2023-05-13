class Public::ItemsController < ApplicationController
  def index
  # ページネーションの機能
    @customer = current_customer
    @items = Item.all.page(params[:page]).per(10)
    @item_count = Item.all.count

  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
end
