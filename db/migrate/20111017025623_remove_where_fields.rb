class RemoveWhereFields < ActiveRecord::Migration
  def self.up
    remove_column :tools, :where_agricultural
    remove_column :tools, :where_declining
    remove_column :tools, :where_local
    remove_column :tools, :where_northern
    remove_column :tools, :where_regional
    remove_column :tools, :where_rural
    remove_column :tools, :where_boom_bust
    remove_column :tools, :where_inter_provincial
    remove_column :tools, :where_municipal
    remove_column :tools, :where_provincial
    remove_column :tools, :where_resource_based
    remove_column :tools, :where_urban
    add_column :tools, :where_created, :string
  end

  def self.down
    remove_column :tools, :where_created
    add_column :tools, :where_urban, :boolean
    add_column :tools, :where_resource_based, :boolean
    add_column :tools, :where_provincial, :boolean
    add_column :tools, :where_municipal, :boolean
    add_column :tools, :where_inter_provincial, :boolean
    add_column :tools, :where_boom_bust, :boolean
    add_column :tools, :where_rural, :boolean
    add_column :tools, :where_regional, :boolean
    add_column :tools, :where_northern, :boolean
    add_column :tools, :where_local, :boolean
    add_column :tools, :where_declining, :boolean
    add_column :tools, :where_agricultural, :boolean
  end
end