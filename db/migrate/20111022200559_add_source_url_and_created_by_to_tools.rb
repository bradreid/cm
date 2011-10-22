class AddSourceUrlAndCreatedByToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :source_url, :string
    add_column :tools, :created_by, :integer
  end

  def self.down
    remove_column :tools, :created_by
    remove_column :tools, :source_url
  end
end
