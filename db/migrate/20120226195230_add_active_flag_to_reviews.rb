class AddActiveFlagToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :active, :boolean, :default => true
  end

  def self.down
    remove_column :reviews, :active
  end
end
