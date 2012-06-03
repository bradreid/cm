class AddLastSharedAtToToolsAndReviews < ActiveRecord::Migration
  def self.up
    add_column :tools, :last_shared_at, :datetime
    add_column :reviews, :last_shared_at, :datetime    
  end

  def self.down
    remove_column :tools, :last_shared_at
    remove_column :reviews, :last_shared_at    
  end
end
