class AddVotesCaching < ActiveRecord::Migration
  def self.up
    add_column :messages, :cached_votes_up, :integer, :default => 0
    add_column :messages, :cached_votes_down, :integer, :default => 0
    add_index  :messages, :cached_votes_up
    add_index  :messages, :cached_votes_down
    add_column :pictures, :cached_votes_up, :integer, :default => 0
    add_column :pictures, :cached_votes_down, :integer, :default => 0
    add_index  :pictures, :cached_votes_up
    add_index  :pictures, :cached_votes_down
    add_column :songs, :cached_votes_up, :integer, :default => 0
    add_column :songs, :cached_votes_down, :integer, :default => 0
    add_index  :songs, :cached_votes_up
    add_index  :songs, :cached_votes_down

    # Uncomment this line to force caching of existing votes
    Message.find_each(&:update_cached_votes)
    Picture.find_each(&:update_cached_votes)
    Song.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :messages, :cached_votes_up
    remove_column :messages, :cached_votes_down
    remove_column :pictures, :cached_votes_up
    remove_column :pictures, :cached_votes_down
    remove_column :songs, :cached_votes_up
    remove_column :songs, :cached_votes_down
  end
end
