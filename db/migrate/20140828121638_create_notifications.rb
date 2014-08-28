class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :attendee, index: true
      t.references :resource, index: true
      t.string :key
      t.boolean :read

      t.datetime :created_at
    end
  end
end
