class AddWhenIndex < ActiveRecord::Migration
  def self.up
    add_index :tools, :when
  end

  def self.down
    remove_index :tools, :when
  end
end