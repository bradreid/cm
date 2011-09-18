class Tools < ActiveRecord::Migration
  def self.up
    create_table :tools, :force => true do |t|
      t.string :name
      t.float :cost_to_obtain
      t.float :cost_to_use
      t.integer :time_to_use
      t.text :other_resources_needed
      t.text :electronics_equipment
      t.text :software
      t.text :method_of_access
      t.text :activities_involved
      t.text :expertise_needed
      t.timestamps
    end
    
    add_index :tools, :name
  end

  def self.down
    remove_index :tools, :name
    drop_table :tools
  end
end