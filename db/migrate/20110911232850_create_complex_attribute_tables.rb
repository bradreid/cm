class CreateComplexAttributeTables < ActiveRecord::Migration
  def self.up
    create_table :tools, :force => true do |t|
      t.timestamps
    end
    add_column :tools, :reading_level, :string
    add_column :tools, :jargon, :string
    add_column :tools, :steps, :string
  end

  def self.down
    drop_table :tools
    remove_column :tools, :steps
    remove_column :tools, :jargon
    remove_column :tools, :reading_level
  end
end