class AddFocusFields < ActiveRecord::Migration
  def self.up
    add_column :tools, :focus_social, :boolean
    add_column :tools, :focus_economic, :boolean
    add_column :tools, :focus_environmental, :boolean
    add_column :tools, :focus_sustainable, :boolean
    remove_column :tools, :focus
  end

  def self.down
    add_column :tools, :focus, :string
    remove_column :tools, :focus_sustainable
    remove_column :tools, :focus_environmental
    remove_column :tools, :focus_economic
    remove_column :tools, :focus_social
  end
end
