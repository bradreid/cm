class Tool < ActiveRecord::Base
  
  validates_presence_of :name, :reading_level, :jargon, :steps
  validates_uniqueness_of :name
end