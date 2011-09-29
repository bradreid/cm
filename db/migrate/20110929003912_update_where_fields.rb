class UpdateWhereFields < ActiveRecord::Migration
  def self.up
    remove_column :tools, :where_neighbourhood
    remove_column :tools, :where_urban_centre
    add_column :tools, :where_municipal, :boolean
    add_column :tools, :where_inter_provincial, :boolean
    add_column :tools, :where_northern, :boolean
    add_column :tools, :where_agricultural, :boolean
    add_column :tools, :where_resource_based, :boolean
    add_column :tools, :where_boom_bust, :boolean
    add_column :tools, :where_declining, :boolean
    
  end

  def self.down
    remove_column :tools, :where_declining
    remove_column :tools, :where_boom_bust
    remove_column :tools, :where_resource_based
    remove_column :tools, :where_agricultural
    remove_column :tools, :where_northern
    remove_column :tools, :where_inter_provincial
    remove_column :tools, :where_municipal
    add_column :tools, :where_urban_centre, :boolean
    add_column :tools, :where_neighbourhood, :boolean
  end
end