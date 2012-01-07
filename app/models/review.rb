class Review < ActiveRecord::Base
  
  validates_presence_of :tool_id, :experience, :community_context, :generates_results, :resources_identified, :format_presentation, :adaptable
  belongs_to :tool
  belongs_to :user
  before_save :add_rating
  after_save :update_tool_stars
   
private

  def add_rating
    r = 0
    questions = [:community_context, :generates_results, :resources_identified, :format_presentation, :adaptable]
    questions.each do |q|
      r += self.send(q)
    end
    self.rating = (r/2.0).ceil
  end
  
  def update_tool_stars
    self.tool.recalc_stars    
  end
end