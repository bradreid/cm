class CreateComplexAttributeTables < ActiveRecord::Migration
  def self.up
    add_column :tools, :reading_level, :string
    add_column :tools, :jargon, :string
    add_column :tools, :steps, :string
  end

  def self.down
    remove_column :tools, :steps
    remove_column :tools, :jargon
    remove_column :tools, :reading_level
  end
end