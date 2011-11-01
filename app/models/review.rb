class Review < ActiveRecord::Base
  validates_presence_of :name, :organization, :current_role, :tool_used, :goal_clear, :tasks_easy_to_understand, :additional_requirements_clear, :tasks_easy_to_implement, :tasks_achieve_goal, :additional_resources_required_for_goal, :easily_adapted, :easily_adapted_cultural, :easily_merged, :insightful_resource, :perfect_to_use_as_presented
  belongs_to :tool
  
  before_save :add_rating
  
  def star_rating
    ranking = 0.0
    questions = [:goal_clear, :tasks_easy_to_understand, :additional_requirements_clear, :tasks_easy_to_implement, :tasks_achieve_goal, :additional_resources_required_for_goal, :easily_adapted, :easily_adapted_cultural, :easily_merged ]
    questions.each do |q|
      ranking += self.send(q).to_f
    end
    ranking = ranking / questions.size.to_f
  end
  
private

  def add_rating
    self.rating = self.star_rating 
    self.tool.add_rating(self.rating)
  end
end