class AddIndex < ActiveRecord::Migration
  def self.up
    add_index :tools, :why
    add_index :tools, :name
    add_index :tools, :description
  end

  def self.down
    remove_index :tools, :description
    remove_index :tools, :name
    remove_index :tools, :why
  end
end