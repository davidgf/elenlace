class AddEventIdToLocation < ActiveRecord::Migration
  def change
    change_table :locations do |t|
        t.references :event
    end
  end
end
