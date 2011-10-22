class RemoveABunchOfFields < ActiveRecord::Migration
  def self.up
    remove_column :tools, :relevant_pages
    remove_column :tools, :total_pages
    remove_column :tools, :method_of_access
    remove_column :tools, :cost_to_use
    remove_column :tools, :cost_to_obtain
    remove_column :tools, :time_to_use
    remove_column :tools, :time_to_use_type
    remove_column :tools, :other_resources_needed
    remove_column :tools, :electronics_equipment
    remove_column :tools, :software
    remove_column :tools, :activities_involved
    
  end

  def self.down
    add_column :tools, :activities_involved, :string
    add_column :tools, :software, :string
    add_column :tools, :electronics_equipment, :string
    add_column :tools, :other_resources_needed, :string
    add_column :tools, :time_to_use_type, :string
    add_column :tools, :time_to_use, :integer
    add_column :tools, :cost_to_obtain, :float
    add_column :tools, :cost_to_use, :float
    add_column :tools, :method_of_access, :string
    add_column :tools, :total_pages, :integer
    add_column :tools, :relevant_pages, :string
  end
end
