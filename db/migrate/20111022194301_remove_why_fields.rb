class RemoveWhyFields < ActiveRecord::Migration
  def self.up
    Tool.new.attributes.map{|a| a[0]}.sort.select{|a| a=~/why_/}.each do |a|
      remove_column :tools, a.to_sym
    end
  end

  def self.down
  end
end
