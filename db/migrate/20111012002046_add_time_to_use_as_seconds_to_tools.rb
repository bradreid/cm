class AddTimeToUseAsSecondsToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :time_to_use_as_seconds, :integer
  end

  def self.down
    remove_column :tools, :time_to_use_as_seconds
  end
end
