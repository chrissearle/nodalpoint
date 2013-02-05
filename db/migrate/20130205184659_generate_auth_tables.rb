class GenerateAuthTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => true, :default => ""
      t.string :email, :null => true, :default => ""

      t.timestamps
    end

    add_index :users, :name, :unique => false
    add_index :users, :email, :unique => false

    create_table :authentications do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :email
      t.integer :user_id

      t.timestamps
    end

    add_index :authentications, :provider, :unique => false
    add_index :authentications, :user_id

    add_column :cameras, :user_id, :integer
    add_column :lenses, :user_id, :integer
    add_column :nodal_points, :user_id, :integer
  end
end
