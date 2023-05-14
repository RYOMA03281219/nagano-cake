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
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    item_id = params[:cart_item][:item_id].to_i
    amount = params[:cart_item][:amount].to_i
    cart_item = current_customer.cart_items.find_by(item_id: item_id)
    if cart_item
      cart_item.update(amount: cart_item.amount + amount)
    else
      cart_item = current_customer.cart_items.new(cart_item_params)
      cart_item.save
    end
      redirect_to cart_items_path


    #   2. カート内の個数をフォームから送られた個数分追加する
    # 存在しなかった場合
    #   カートモデルにレコードを新規作成する

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
