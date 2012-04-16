include ActionView::Helpers::TranslationHelper

class FormConstants

  def self.language
    [t(:en, :scope=>[:formconstants,:language]), t(:fr, :scope=>[:formconstants,:language]), t(:bi, :scope=>[:formconstants,:language]), t(:both, :scope=>[:formconstants,:language])]
  end  
  
  def self.rating
    [t(:one, :scope=>[:formconstants,:rating]), t(:two, :scope=>[:formconstants,:rating]), t(:three, :scope=>[:formconstants,:rating]), t(:four, :scope=>[:formconstants,:rating]), t(:five, :scope=>[:formconstants,:rating])]
  end  
  
  def self.when
    [t(:organizing, :scope=>[:formconstants,:when]),t(:planning, :scope=>[:formconstants,:when]),t(:analyzing, :scope=>[:formconstants,:when]),t(:implementing, :scope=>[:formconstants,:when]),t(:reviewing, :scope=>[:formconstants,:when])]
  end
  
  def self.organizing_purpose
    [t(:org_partnership, :scope=>[:formconstants,:when]),t(:org_fundraising, :scope=>[:formconstants,:when]),t(:org_teambuilding, :scope=>[:formconstants,:when]),t(:org_engagement, :scope=>[:formconstants,:when])]
  end
  
  def self.planning_purpose
    [t(:plan_vis, :scope=>[:formconstants,:when]),t(:plan_act, :scope=>[:formconstants,:when]),t(:plan_man, :scope=>[:formconstants,:when])]
  end
  
  def self.implementing_purpose
    [t(:impl_natural, :scope=>[:formconstants,:when]),t(:impl_cultural, :scope=>[:formconstants,:when]),t(:impl_hr, :scope=>[:formconstants,:when]),t(:impl_social, :scope=>[:formconstants,:when]),t(:impl_gov, :scope=>[:formconstants,:when]),t(:impl_financial, :scope=>[:formconstants,:when]),t(:impl_comm, :scope=>[:formconstants,:when])]
  end
  
  def self.reviewing_purpose
    [t(:rev_proj, :scope=>[:formconstants,:when]),t(:rev_proc, :scope=>[:formconstants,:when]),t(:rev_feedback, :scope=>[:formconstants,:when])]
  end
  
  def self.analyzing_purpose
    [t(:anal_ass, :scope=>[:formconstants,:when]),t(:anal_comp, :scope=>[:formconstants,:when])]
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
