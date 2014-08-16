class AddNamesToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :bride_name, :string
    add_column :weddings, :groom_name, :string
  end
end
