class RenameWeddingUsersTable < ActiveRecord::Migration
  def change
    rename_table :wedding_users_tables, :wedding_users
  end
end
