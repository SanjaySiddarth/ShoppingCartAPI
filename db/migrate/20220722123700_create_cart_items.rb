class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.integer :quantity
      t.float :total_price
      t.string :addons
      t.string :variations
      t.float :base_price
      t.timestamps
    end
  end
end
