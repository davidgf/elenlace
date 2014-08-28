class AddResourceTypeToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :resource_type, :string
  end
end
