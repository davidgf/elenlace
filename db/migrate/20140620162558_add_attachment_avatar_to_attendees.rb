class AddAttachmentAvatarToAttendees < ActiveRecord::Migration
  def self.up
    change_table :attendees do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :attendees, :avatar
  end
end
