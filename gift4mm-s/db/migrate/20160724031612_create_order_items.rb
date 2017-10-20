class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.text :title
      t.text :description
      t.decimal :unitprice
      t.integer :quantity
      t.text :image
      t.decimal :totalprice
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
