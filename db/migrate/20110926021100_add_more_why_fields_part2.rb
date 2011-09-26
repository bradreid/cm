class AddMoreWhyFieldsPart2 < ActiveRecord::Migration
  def self.up
    add_column :tools, :why_impact_analysis, :boolean
    add_column :tools, :why_environmental_analysis, :boolean
    add_column :tools, :why_committee_analysis, :boolean
    add_column :tools, :why_visioning, :boolean
    add_column :tools, :why_project_management_control, :boolean
    add_column :tools, :why_project_management_monitoring, :boolean
    add_column :tools, :why_whole_community_planning, :boolean
    add_column :tools, :why_cost_benefit_analysis, :boolean
    add_column :tools, :why_physical_environment_analysis, :boolean
    add_column :tools, :why_community_profile_analysis, :boolean
    add_column :tools, :why_community_indicator_analysis, :boolean
    add_column :tools, :empowerment, :boolean
    add_column :tools, :why_proverty_reduction, :boolean
    add_column :tools, :why_physical_environment, :boolean
    add_column :tools, :why_community_event, :boolean
    add_column :tools, :why_budget_review, :boolean
  end

  def self.down
    remove_column :tools, :why_budget_review
    remove_column :tools, :why_community_event
    remove_column :tools, :why_physical_environment
    remove_column :tools, :why_proverty_reduction
    remove_column :tools, :empowerment
    remove_column :tools, :why_community_indicator_analysis
    remove_column :tools, :why_community_profile_analysis
    remove_column :tools, :why_physical_environment_analysis
    remove_column :tools, :why_cost_benefit_analysis
    remove_column :tools, :why_whole_community_planning
    remove_column :tools, :why_project_management_monitoring
    remove_column :tools, :why_project_management_control
    remove_column :tools, :why_visioning
    remove_column :tools, :why_committee_analysis
    remove_column :tools, :why_environmental_analysis
    remove_column :tools, :why_impact_analysis
  end
end