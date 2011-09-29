class UpdateWhoFields < ActiveRecord::Migration
  def self.up
    remove_column :tools, :who_associations
    remove_column :tools, :who_individuals
    remove_column :tools, :who_organizations
    add_column :tools, :who_ced_practicioner, :boolean
    add_column :tools, :who_ced_service_organization, :boolean
    add_column :tools, :who_community_based_service, :boolean
    add_column :tools, :who_organization, :boolean
    add_column :tools, :who_volunteer_groups, :boolean
    
    remove_column :tools, :whobeneficiaries_associations
    remove_column :tools, :whobeneficiaries_individuals
    remove_column :tools, :whobeneficiaries_organizations    
    add_column :tools, :whobeneficiaries_ced_practicioner, :boolean
    add_column :tools, :whobeneficiaries_ced_service_organization, :boolean
    add_column :tools, :whobeneficiaries_community_based_service, :boolean
    add_column :tools, :whobeneficiaries_organization, :boolean
    add_column :tools, :whobeneficiaries_volunteer_groups, :boolean    
  end

  def self.down
    remove_column :tools, :who_volunteer_groups
    remove_column :tools, :who_organization
    remove_column :tools, :who_community_based_service
    remove_column :tools, :who_ced_service_organization
    remove_column :tools, :who_ced_practicioner
    add_column :tools, :who_organizations, :boolean
    add_column :tools, :who_individuals, :boolean
    add_column :tools, :who_associations, :boolean
    
    remove_column :tools, :whobeneficiaries_volunteer_groups
    remove_column :tools, :whobeneficiaries_organization
    remove_column :tools, :whobeneficiaries_community_based_service
    remove_column :tools, :whobeneficiaries_ced_service_organization
    remove_column :tools, :whobeneficiaries_ced_practicioner
    add_column :tools, :whobeneficiaries_organizations, :boolean
    add_column :tools, :whobeneficiaries_individuals, :boolean
    add_column :tools, :whobeneficiaries_associations, :boolean    
  end
end