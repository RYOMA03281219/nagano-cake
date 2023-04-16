class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :postage, null: false
      t.string :billing_amount, null: false
      t.integer :payment_method, null:false
      t.boolean :order_status, null: false, default: true


      t.timestamps
    end
  end
end