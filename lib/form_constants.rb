include ActionView::Helpers::TranslationHelper

class FormConstants
  def self.reading_levels
    ['Grade 5/6', 'Grade 8', 'Grade 12', 'Bachelors', 'Masters', 'PhD']
  end
  
  def self.jargon
    ['0-10', '11-20', '21-30', '30+']
  end
  
  def self.steps
    ['1-3', '4-6', '7-10', '10+']
  end  
  
  def self.focus
    ["Social", "Economic", "Environment"]
  end
  
  def self.time_units
    ['Minute', 'Hour', 'Day', 'Week', 'Month', 'Year']
  end  
  
  def self.language
    ['English Only', 'French Only', 'Bilingual', 'Both Available']
  end  
  
  def self.rating
    [t(:one, :scope=>[:formconstants,:rating]), t(:two, :scope=>[:formconstants,:rating]), t(:three, :scope=>[:formconstants,:rating]), t(:four, :scope=>[:formconstants,:rating]), t(:five, :scope=>[:formconstants,:rating])]
  end  
  
  def self.when
    ['Organizing', 'Planning', 'Analyzing', 'Implementing', 'Reviewing']
  end
  
  def self.organizing_purpose
    ['Partnership Building', 'Fundraising', 'Project Team Building', 'Engagement']
  end
  
  def self.planning_purpose
    ['Visioning', 'Action Planning', 'Project Management']
  end
  
  def self.implementing_purpose
    ['Natural Resources', 'Cultural and Arts', 'Human Resources', 'Social Capital', 'Governance', 'Financial', 'Community Infrastructure']
  end
  
  def self.reviewing_purpose
    ['Project Evaluation', 'Process Evaluation', 'Community Feedback']
  end
  
  def self.analyzing_purpose
    ['Assessment', 'Comprehensive Analysis']
  end

  def self.where
    ['Local', 'Municipal', 'Regional', 'Rural','Northern', 'Urban', 'Not Specified']
  end
  
  def self.topic
    ['People', 'Green', 'Grow', 'Balanced', 'Not Specified']
  end
  
  def self.expertise_needed
    ['High-school', 'College', 'University', 'Technical', 'Other', 'Not Specified']
  end
end
