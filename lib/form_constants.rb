include ActionView::Helpers::TranslationHelper

class FormConstants

  def self.language
    [ 'English Only', 'French Only', 'Bilingual', 'Both Available' ]
  end  
  
  def self.rating
    [ 'One Star', 'Two Stars', 'Three Stars', 'Four Stars', 'Five Stars' ]
  end  
  
  def self.when
    [ 'Organizing', 'Planning', 'Analyzing', 'Implementing', 'Reviewing']
  end

  def self.whendefns
    [t(:alt_org), t(:alt_plan), t(:alt_anal), t(:alt_impl), t(:alt_rev) ]
  end
  
  def self.organizing_purpose
    [ 'Partnership Building', 'Fundraising', 'Project Team Building', 'Engagement' ]
  end
  
  def self.planning_purpose
    [ 'Visioning', 'Action Planning', 'Project Management' ]
  end
  
  def self.implementing_purpose
    [ 'Natural Resources', 'Cultural and Arts', 'Human Resources', 'Social Capital', 'Governance', 'Financial', 'Community Infrastructure' ]
  end
  
  def self.reviewing_purpose
    [ 'Project Evaluation', 'Process Evaluation', 'Community Feedback' ] 
  end
  
  def self.analyzing_purpose
    [ 'Assessment', 'Comprehensive Analysis' ]
  end

  def self.orgdefns
    [ t(:alt_org_partnership), t(:alt_org_fundraising), t(:alt_org_teambuilding), t(:alt_org_engagement) ]
  end

  def self.plandefns
    [ t(:alt_plan_vis), t(:alt_plan_act), t(:alt_plan_man) ]
  end

  def self.analdefns
    [ t(:alt_anal_ass), t(:alt_anal_comp) ]
  end

  def self.impldefns
    [ t(:alt_impl_natural), t(:alt_impl_cultural), t(:alt_impl_hr), t(:alt_impl_social), t(:alt_impl_gov), t(:alt_impl_financial), t(:alt_impl_comm) ]
  end

  def self.revdefns
    [ t(:alt_rev_proj), t(:alt_rev_proc), t(:alt_rev_feedback) ]
  end

  def self.where
    [ 'Local', 'Municipal', 'Regional', 'Rural', 'Northern', 'Urban', 'Not Specified'] 
  end
  
  def self.topic
    [ 'People', 'Green', 'Grow', 'Balanced', 'Not Specified' ]
  end
  
  def self.expertise_needed
    [ 'High School', 'College', 'University', 'Technical Certification', 'Other', 'Not Specified'] 
  end
end
