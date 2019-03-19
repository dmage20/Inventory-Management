class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desciption
      t.integer :quantity
      t.float :cost
      t.float :price

      t.timestamps
    end
  end
end
