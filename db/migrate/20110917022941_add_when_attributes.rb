class AddWhenAttributes < ActiveRecord::Migration
  def self.up
    add_column :tools, :when_info_gathering, :boolean
    add_column :tools, :when_review, :boolean
    add_column :tools, :when_planning, :boolean
    add_column :tools, :when_implementing, :boolean
    add_column :tools, :when_analyzing, :boolean
    add_column :tools, :when_organizing, :boolean
  end

  def self.down
    remove_column :tools, :when_organizing
    remove_column :tools, :when_analyzing
    remove_column :tools, :when_implementing
    remove_column :tools, :when_planning
    remove_column :tools, :when_review
    remove_column :tools, :when_info_gathering
  end
end