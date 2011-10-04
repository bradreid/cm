class UpdateWhoBenificiariesAttributes < ActiveRecord::Migration
  def self.up
    remove_column :tools, :whobeneficiaries_ced_practicioner
    remove_column :tools, :whobeneficiaries_ced_service_organization
    remove_column :tools, :whobeneficiaries_community_based_service
    remove_column :tools, :whobeneficiaries_volunteer_groups
    remove_column :tools, :whobeneficiaries_organization
    
    add_column :tools, :whobeneficiaries_first_nations, :boolean
    add_column :tools, :whobeneficiaries_metis, :boolean
    add_column :tools, :whobeneficiaries_youth, :boolean
    add_column :tools, :whobeneficiaries_seniors, :boolean
    add_column :tools, :whobeneficiaries_women, :boolean
  end

  def self.down
    add_column :tools, :whobeneficiaries_organization, :boolean
    remove_column :tools, :whobeneficiaries_women
    remove_column :tools, :whobeneficiaries_seniors
    remove_column :tools, :whobeneficiaries_youth
    remove_column :tools, :whobeneficiaries_metis
    remove_column :tools, :whobeneficiaries_first_nations
    add_column :tools, :whobeneficiaries_volunteer_groups, :boolean
    add_column :tools, :whobeneficiaries_community_based_service, :boolean
    add_column :tools, :whobeneficiaries_ced_service_organization, :boolean
    add_column :tools, :whobeneficiaries_ced_practicioner, :boolean
  end
end
