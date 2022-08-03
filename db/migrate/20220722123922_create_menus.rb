class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.text :desc
      t.float :item_price
      t.timestamps
    end
  end
end
