class AddWhyToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :why, :string
  end

  def self.down
    remove_column :tools, :why
  end
end
