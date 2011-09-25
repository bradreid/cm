class AddRatingToTools < ActiveRecord::Migration
  def self.up
    add_column :tools, :rating, :float
  end

  def self.down
    remove_column :tools, :rating
  end
end
