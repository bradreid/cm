class ChageWhereToText < ActiveRecord::Migration
  def self.up
    change_column :tools, :where, :text
  end

  def self.down
    change_column :tools, :where, :string
  end
end