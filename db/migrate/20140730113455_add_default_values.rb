class AddDefaultValues < ActiveRecord::Migration
  def up
    Attendee.where(description: nil).update_all(description: "")
    Message.where(message: nil).update_all(message: "")
    Picture.where(name: nil).update_all(name: "")
  	change_column :attendees, :description, :text, :null => false, :default => ""
  	change_column :messages, :message, :text, :null => false, :default => ""
  	# change_column :pictures, :name, :string, :null => false, :default => ""
  end

  def down
  end
end
