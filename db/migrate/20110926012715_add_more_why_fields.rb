class AddMoreWhyFields < ActiveRecord::Migration
  def self.up
    add_column :tools, :why_asset_acquisition, :boolean
    add_column :tools, :why_asset_mobilization, :boolean
    add_column :tools, :why_economic_assesment, :boolean
    add_column :tools, :why_institutional_assessment, :boolean
    add_column :tools, :why_environmental_impact_assessment, :boolean
    add_column :tools, :why_poverty_assessment, :boolean
    add_column :tools, :why_project_assessment, :boolean
    add_column :tools, :why_communications_development, :boolean
    add_column :tools, :why_community_economic_development, :boolean
    add_column :tools, :why_community_development, :boolean
    add_column :tools, :why_partnership_building, :boolean
    add_column :tools, :why_leadership_building, :boolean
  end

  def self.down
    remove_column :tools, :why_leadership_building
    remove_column :tools, :why_partnership_building
    remove_column :tools, :why_community_development
    remove_column :tools, :why_community_economic_development
    remove_column :tools, :why_communications_development
    remove_column :tools, :why_project_assessment
    remove_column :tools, :why_poverty_assessment
    remove_column :tools, :why_environmental_impact_assessment
    remove_column :tools, :why_institutional_assessment
    remove_column :tools, :why_economic_assesment
    remove_column :tools, :why_asset_mobilization
    remove_column :tools, :why_asset_acquisition
  end
end