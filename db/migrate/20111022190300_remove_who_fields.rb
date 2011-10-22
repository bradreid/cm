class RemoveWhoFields < ActiveRecord::Migration
  def self.up
    remove_column :tools, :who_ced_practicioner
    remove_column :tools, :who_ced_service_organization
    remove_column :tools, :who_community_based_service
    remove_column :tools, :who_organization
    remove_column :tools, :who_volunteer_groups
    
    remove_column :tools, :whobeneficiaries_first_nations
    remove_column :tools, :whobeneficiaries_metis
    remove_column :tools, :whobeneficiaries_youth
    remove_column :tools, :whobeneficiaries_seniors
    remove_column :tools, :whobeneficiaries_women
  end

  def self.down
    add_column :tools, :whobeneficiaries_women, :boolean
    add_column :tools, :whobeneficiaries_seniors, :boolean
    add_column :tools, :whobeneficiaries_youth, :boolean
    add_column :tools, :whobeneficiaries_metis, :boolean
    add_column :tools, :whobeneficiaries_first_nations, :boolean
    
    add_column :tools, :who_volunteer_groups, :boolean
    add_column :tools, :who_organization, :boolean
    add_column :tools, :who_community_based_service, :boolean
    add_column :tools, :who_ced_service_organization, :boolean
    add_column :tools, :who_ced_practicioner, :boolean
  end
end

