class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @item_count = Item.all.count
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def update
    @cart_items = CartItem.find(params[:id])
    if @cart_items.update!(cart_item_params)
      redirect_to cart_items_path
    end
  end

  def destroy
    current_customer.cart_items.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    #binding.pry
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save!
      redirect_to cart_items_path
    else
      render "new"
    end
    #   2. カート内の個数をフォームから送られた個数分追加する
    # 存在しなかった場合
    #   カートモデルにレコードを新規作成する

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
