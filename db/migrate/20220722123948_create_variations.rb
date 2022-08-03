class CreateVariations < ActiveRecord::Migration[6.0]
  def change
    create_table :variations do |t|
      t.references :menu, null: false, foreign_key: true
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
