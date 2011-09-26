class AddFocusToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :focus, :string
  end

  def self.down
    remove_column :tools, :focus
  end
end
