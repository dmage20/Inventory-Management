class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :delivery_date
      t.references :customer, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
