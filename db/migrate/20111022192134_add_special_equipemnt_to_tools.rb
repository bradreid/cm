class AddSpecialEquipemntToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :special_equipment_facilities, :string
  end

  def self.down
    remove_column :tools, :special_equipment_facilities
  end
end
