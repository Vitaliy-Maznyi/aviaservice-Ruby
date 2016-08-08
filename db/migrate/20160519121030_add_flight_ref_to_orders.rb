class AddFlightRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :flight, index: true, foreign_key: true
  end
end
