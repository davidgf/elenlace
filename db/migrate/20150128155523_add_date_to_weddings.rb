class AddDateToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :date, :date
  end
end
