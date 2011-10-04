class CreateComplexAttributeTables < ActiveRecord::Migration
  def self.up
    create_table :tools, :force => true do |t|
      t.string :name
      t.string :method_of_access
      t.float :cost_to_use
      t.float :cost_to_obtain
      t.integer :time_to_use
      t.string :other_resources_needed
      t.string :electronics_equipment
      t.string :software
      t.string :activities_involved
      t.string :expertise_needed
      t.timestamps
    end
    add_column :tools, :reading_level, :string
    add_column :tools, :jargon, :string
    add_column :tools, :steps, :string
  end

  def self.down
   
    remove_column :tools, :steps
    remove_column :tools, :jargon
    remove_column :tools, :reading_level
    drop_table :tools    
  end
end