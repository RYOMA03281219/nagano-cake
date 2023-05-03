class Public::ItemsController < ApplicationController
  def index
  # ページネーションの機能
    @items = Item.all.page(params[:page]).per(10)
    @item_count = Item.all.count

  end

  def show
    @customer = current_customer
    @item = Item.find(params[:id])
  end
end
