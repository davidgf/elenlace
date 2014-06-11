class ChangeUserIdToWeddingUserId < ActiveRecord::Migration
  def change
    rename_column :dances, :user_id, :wedding_user_id
    rename_column :messages, :user_id, :wedding_user_id
    rename_column :pictures, :user_id, :wedding_user_id
  end
end
