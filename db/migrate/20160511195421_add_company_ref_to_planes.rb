class AddCompanyRefToPlanes < ActiveRecord::Migration
  def change
    add_reference :planes, :company, index: true, foreign_key: true
  end
end
