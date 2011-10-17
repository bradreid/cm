class RemoveWhenFields < ActiveRecord::Migration
  def self.up
    remove_column :tools, :when_organizing
    remove_column :tools, :when_planning
    remove_column :tools, :when_analyzing
    remove_column :tools, :when_implementing
    remove_column :tools, :when_reviewing
    add_column :tools, :when, :string
  end

  def self.down
    remove_column :tools, :when
    add_column :tools, :when_reviewing, :boolean
    add_column :tools, :when_implementing, :boolean
    add_column :tools, :when_analyzing, :boolean
    add_column :tools, :when_planning, :boolean
    add_column :tools, :when_organizing, :boolean
  end
end