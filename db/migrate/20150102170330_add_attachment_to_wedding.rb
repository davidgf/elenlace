class AddAttachmentToWedding < ActiveRecord::Migration
  def self.up
    change_table :weddings do |t|
      t.attachment :cover_image
    end
  end

  def self.down
    drop_attached_file :weddings, :cover_image
  end
end
