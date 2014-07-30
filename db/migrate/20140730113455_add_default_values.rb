class AddDefaultValues < ActiveRecord::Migration
  def change
  	change_column :attendees, :description, :text, :null => false, :default => ""
  	change_column :messages, :message, :text, :null => false, :default => ""
  	change_column :pictures, :name, :string, :null => false, :default => ""
  end
end
