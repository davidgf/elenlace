class AddWeddingRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :wedding, index: true
  end
end
