class AddCachedVotesScore < ActiveRecord::Migration
  def change
    add_column :messages, :cached_votes_score, :integer, :default => 0
    add_index  :messages, :cached_votes_score
    add_column :pictures, :cached_votes_score, :integer, :default => 0
    add_index  :pictures, :cached_votes_score
    add_column :songs, :cached_votes_score, :integer, :default => 0
    add_index  :songs, :cached_votes_score

    # Uncomment this line to force caching of existing votes
    Message.find_each(&:update_cached_votes)
    Picture.find_each(&:update_cached_votes)
    Song.find_each(&:update_cached_votes)
  end
end
