class RenameWeddingUserToAttendee < ActiveRecord::Migration
  def change
    rename_table :wedding_users, :attendees
    rename_column :dances, :wedding_user_id, :attendee_id
    rename_column :messages, :wedding_user_id, :attendee_id
    rename_column :pictures, :wedding_user_id, :attendee_id
  end
end
