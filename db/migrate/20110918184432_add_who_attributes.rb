class AddWhoAttributes < ActiveRecord::Migration
  def self.up
    add_column :tools, :who_charity, :boolean
    add_column :tools, :who_non_profit, :boolean
    add_column :tools, :who_social_enterprise, :boolean
    add_column :tools, :who_company, :boolean
    add_column :tools, :who_community_economic_development_organization, :boolean
  end

  def self.down
    remove_column :tools, :who_community_economic_development_organization
    remove_column :tools, :who_company
    remove_column :tools, :who_social_enterprise
    remove_column :tools, :who_non_profit
    remove_column :tools, :who_charity
  end
end