class AddMoreWhoFields < ActiveRecord::Migration
  def self.up
    remove_column :tools, :who_charity
    remove_column :tools, :who_community_economic_development_organization
    remove_column :tools, :who_company  
    remove_column :tools, :who_non_profit
    remove_column :tools, :who_social_enterprise
    
    add_column :tools, :who_individuals, :boolean
    add_column :tools, :who_organizations, :boolean
    add_column :tools, :who_associations, :boolean
    add_column :tools, :whobeneficiaries_individuals, :boolean
    add_column :tools, :whobeneficiaries_organizations, :boolean
    add_column :tools, :whobeneficiaries_associations, :boolean
  end

  def self.down
    remove_column :tools, :whobeneficiaries_associations
    remove_column :tools, :whobeneficiaries_organizations
    remove_column :tools, :whobeneficiaries_individuals
    remove_column :tools, :who_associations
    remove_column :tools, :who_organizations
    remove_column :tools, :who_individuals
    add_column :tools, :who_social_enterprise, :boolean
    add_column :tools, :who_non_profit, :boolean
    add_column :tools, :who_company, :boolean
    add_column :tools, :who_community_economic_development_organization, :boolean
    add_column :tools, :who_charity, :boolean
  end
end