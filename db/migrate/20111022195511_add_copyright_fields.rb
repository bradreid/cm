class AddCopyrightFields < ActiveRecord::Migration
  def self.up
    add_column :tools, :copyright, :boolean
    add_column :tools, :copyright_holder, :string
    add_column :tools, :copyright_restrictions, :string
    add_column :tools, :copyright_permissions, :string
  end

  def self.down
    remove_column :tools, :copyright_permissions
    remove_column :tools, :copyright_restrictions
    remove_column :tools, :copyright_holder
    remove_column :tools, :copyright
  end
end