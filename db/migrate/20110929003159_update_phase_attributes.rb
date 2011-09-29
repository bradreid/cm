class UpdatePhaseAttributes < ActiveRecord::Migration
  def self.up
    remove_column :tools, :when_info_gathering
    rename_column :tools, :when_review, :when_reviewing
  end

  def self.down
    rename_column :tools, :when_reviewing, :when_review
    add_column :tools, :when_info_gathering, :boolean
  end
end