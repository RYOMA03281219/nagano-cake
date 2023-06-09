class Order < ApplicationRecord
  def subtotal
    item.with_tax_price * amount
  end

  has_many :order_details
  belongs_to :customer

  enum payment_method: { クレジットカード: 0, 銀行振込: 1 }
  enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
end
