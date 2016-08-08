class AddCompanyRefToFlights < ActiveRecord::Migration
  def change
    add_reference :flights, :company, index: true, foreign_key: true
  end
end
