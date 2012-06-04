class AddEmailNewUserToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email_new_user, :boolean, :default => false
    add_index :users, :email_new_user
  end

  def self.down
    remove_index :users, :email_new_user
    remove_column :users, :email_new_user
  end
end