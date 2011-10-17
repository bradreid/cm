class AddPublisherToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :publisher, :string
  end

  def self.down
    remove_column :tools, :publisher
  end
end
