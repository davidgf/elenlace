class AddAttendeeToSongs < ActiveRecord::Migration
  def change
    change_table :songs do |t|
        t.references :attendee
    end
  end
end
