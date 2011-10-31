class Review < ActiveRecord::Base
  validates_presence_of :name, :organization, :current_role, :tool_used, :goal_clear, :tasks_easy_to_understand, :additional_requirements_clear, :tasks_easy_to_implement, :tasks_achieve_goal
  belongs_to :tool
end