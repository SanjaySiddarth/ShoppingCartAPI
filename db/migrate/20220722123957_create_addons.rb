class CreateAddons < ActiveRecord::Migration[6.0]
  def change
    create_table :addons do |t|
      t.references :menu, null: false, foreign_key: true
      t.string :name
      t.string :price
      t.timestamps
    end
  end
end
