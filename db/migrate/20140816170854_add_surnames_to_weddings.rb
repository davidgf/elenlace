class AddSurnamesToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :bride_surname, :string
    add_column :weddings, :groom_surname, :string
  end
end
