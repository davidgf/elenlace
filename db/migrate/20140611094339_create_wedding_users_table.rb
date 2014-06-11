class CreateWeddingUsersTable < ActiveRecord::Migration
  def change
    create_table :wedding_users_tables do |t|
        t.string :auth_token
        t.string :password
        t.string :username
        t.string :role
        t.references :table, index: true
        t.references :wedding, index: true
        t.text :description
        t.string :type

        t.timestamps
    end

    change_table :users do |t|
        t.remove :role
        t.remove :table_id
        t.remove :wedding_id
        t.remove :description
        t.remove :password
        t.remove :auth_token
    end
  end
end
