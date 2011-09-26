class RenameToolAttributes < ActiveRecord::Migration
  def self.up
    remove_column :tools, :why_team_building
    rename_column :tools, :why_leadership_building, :why_leadership_capacity_building
    rename_column :tools, :why_community_building, :why_community_capacity_building
  end

  def self.down
    rename_column :tools, :why_community_capacity_building, :why_community_building
    rename_column :tools, :why_leadership_capacity_building, :why_leadership_building
    add_column :tools, :why_team_building, :boolean
  end
end