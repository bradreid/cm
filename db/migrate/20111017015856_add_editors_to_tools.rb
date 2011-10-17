class AddEditorsToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :editor, :string
  end

  def self.down
    remove_column :tools, :editor
  end
end
