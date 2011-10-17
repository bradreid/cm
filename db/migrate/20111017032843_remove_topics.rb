class RemoveTopics < ActiveRecord::Migration
  def self.up
    remove_column :tools, :focus_economic
    remove_column :tools, :focus_environmental
    remove_column :tools, :focus_social
    remove_column :tools, :focus_sustainable
    add_column :tools, :topic, :string
  end

  def self.down
    remove_column :tools, :topic
    add_column :tools, :focus_sustainable, :boolean
    add_column :tools, :focus_social, :boolean
    add_column :tools, :focus_environmental, :boolean
    add_column :tools, :focus_economic, :boolean
  end
end