class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :role
      t.references :table, index: true
      t.text :description

      t.timestamps
    end
  end
end
