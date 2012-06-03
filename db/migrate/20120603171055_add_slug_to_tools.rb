class AddSlugToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :slug, :string
    add_index :tools, :slug, :unique => true    
  end

  def self.down
    remove_column :tools, :slug
  end
end
