class Public::CartItemsController < ApplicationController
  def index

  end

  def update
  end

  def destroy
  end

  def destroy_all
    current_custmer.curtitems.destroy_all
    redirect_to cart_items_path
  end

  def create
    #binding.pry
    @cart_items = CartItem.find(params[:id])
    
    if @cart_items.save!
      redirect_to cart_items_path(@cart_items.id)
    else
      render "new"
    end
      2. カート内の個数をフォームから送られた個数分追加する
    存在しなかった場合
      カートモデルにレコードを新規作成する
    
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
