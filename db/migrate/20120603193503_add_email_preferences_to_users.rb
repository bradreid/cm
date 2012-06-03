class AddEmailPreferencesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email_new_tools, :boolean, :default => false
    add_column :users, :email_new_reviews, :boolean, :default => false
    add_index :users, :email_new_tools
    add_index :users, :email_new_reviews
  end

  def self.down
    remove_index :users, :email_new_reviews
    remove_index :users, :email_new_tools
    remove_column :users, :email_new_reviews
    remove_column :users, :email_new_tools
  end
end