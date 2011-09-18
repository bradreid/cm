class AddWhereAttributes < ActiveRecord::Migration
  def self.up
    add_column :tools, :where, :string
    add_column :tools, :where_regional, :boolean
    add_column :tools, :where_local, :boolean
    add_column :tools, :where_rural, :boolean
    add_column :tools, :where_urban, :boolean
    add_column :tools, :where_urban_centre, :boolean
    add_column :tools, :where_neighbourhood, :boolean
  end

  def self.down
    remove_column :tools, :where_neighbourhood
    remove_column :tools, :where_urban_centre
    remove_column :tools, :where_urban
    remove_column :tools, :where_rural
    remove_column :tools, :where_local
    remove_column :tools, :where_regional
    remove_column :tools, :where
  end
end