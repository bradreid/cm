class AddWhereProvincialToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :where_provincial, :boolean
  end

  def self.down
    remove_column :tools, :where_provincial
  end
end
