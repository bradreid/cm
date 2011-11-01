class ChangeToolUsedToString < ActiveRecord::Migration
  def self.up
    change_column :reviews, :tool_used, :string
  end

  def self.down
    change_column :reviews, :tool_used, :boolean
  end
end