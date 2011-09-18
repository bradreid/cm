class AddHowAttributes < ActiveRecord::Migration
  def self.up
    add_column :tools, :time_to_use_type, :string
  end

  def self.down
    remove_column :tools, :time_to_use_type
  end
end