class AddRankingColumns < ActiveRecord::Migration
  def self.up
    add_column :reviews, :rating, :float
    add_column :tools, :rating_count, :integer
    add_column :tools, :rating_total, :float
  end

  def self.down
    remove_column :tools, :rating_total
    remove_column :tools, :rating_count
    remove_column :reviews, :rating
  end
end