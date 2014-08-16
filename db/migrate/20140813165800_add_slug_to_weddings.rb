class AddSlugToWeddings < ActiveRecord::Migration
  def change
    add_column :weddings, :slug, :string
    add_index :weddings, :slug
  end
end
