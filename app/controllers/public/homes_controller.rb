class Public::HomesController < ApplicationController
  def top
    @recommend_items = Item.last(4)
    # @items = Item.all
  end

end
