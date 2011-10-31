class AddCommentsAndChangeBooleanFields < ActiveRecord::Migration
  def self.up
    add_column :tools, :comments, :text
    change_column :tools, :copyright, :string
  end

  def self.down
    change_column :tools, :copyright, :boolean
    remove_column :tools, :comments
  end
end