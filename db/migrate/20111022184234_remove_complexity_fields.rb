class RemoveComplexityFields < ActiveRecord::Migration
  def self.up
    remove_column :tools, :reading_level
    remove_column :tools, :jargon
    remove_column :tools, :steps
  end

  def self.down
    add_column :tools, :steps, :string
    add_column :tools, :jargon, :string
    add_column :tools, :reading_level, :string
  end
end
