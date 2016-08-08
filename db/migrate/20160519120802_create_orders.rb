class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :econom_seats
      t.integer :business_seats
      t.integer :price

      t.timestamps null: false
    end
  end
end
