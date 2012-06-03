class AddDisplayNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :user_description, :string
    add_index :users, :user_description
  end

  def self.down
    remove_index :users, :user_description
    remove_column :users, :user_description
  end
end