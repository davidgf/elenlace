class CreateDances < ActiveRecord::Migration
  def change
    create_table :dances do |t|
      t.references :user, index: true
      t.references :partner, index: true
      t.time :time

      t.timestamps
    end
  end
end
