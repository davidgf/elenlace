class AddWeddingIdToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :wedding, index: true
  end
end
