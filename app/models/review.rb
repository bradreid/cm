class Review < ActiveRecord::Base
  validates_presence_of :name, :organization, :current_role, :tool_used, :goal_clear
  belongs_to :tool
end