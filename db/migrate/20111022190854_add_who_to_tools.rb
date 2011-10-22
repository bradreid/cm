class AddWhoToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :who, :string
  end

  def self.down
    remove_column :tools, :who
  end
end
