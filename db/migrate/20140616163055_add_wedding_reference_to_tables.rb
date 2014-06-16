class AddWeddingReferenceToTables < ActiveRecord::Migration
  def change
    add_reference :tables, :wedding, index: true
  end
end
