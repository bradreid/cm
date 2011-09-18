class AddWhyAttributes < ActiveRecord::Migration
  def self.up
    add_column :tools, :why_collective_visioning, :boolean
    add_column :tools, :why_solution_building, :boolean
    add_column :tools, :why_action_planning, :boolean
    add_column :tools, :why_community_building, :boolean
    add_column :tools, :why_needs_analysis, :boolean
    add_column :tools, :why_budgeting, :boolean
    add_column :tools, :why_leadership_building, :boolean
    add_column :tools, :why_team_building, :boolean
    add_column :tools, :why_asset_mapping, :boolean
  end

  def self.down
    remove_column :tools, :why_asset_mapping
    remove_column :tools, :why_team_building
    remove_column :tools, :why_leadership_building
    remove_column :tools, :why_budgeting
    remove_column :tools, :why_needs_analysis
    remove_column :tools, :why_community_building
    remove_column :tools, :why_action_planning
    remove_column :tools, :why_solution_building
    remove_column :tools, :why_collective_visioning
  end
end