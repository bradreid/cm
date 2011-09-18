class Tool < ActiveRecord::Base
  has_attached_file :source_document, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"
  
  validates_presence_of :name, :reading_level, :jargon, :steps, :cost_to_obtain, :cost_to_use, :time_to_use, :author, :date_created, :language
  validates_numericality_of :cost_to_obtain, :cost_to_use, :time_to_use
  validates_uniqueness_of :name
  validate :where_required, :when_required, :why_required, :who_required
  
  def select_true_attributes(attrs)
    attrs.select{|attr| self.send(attr)}.map{|m| m.to_s.gsub(/^[^_]*_/, '')}
  end
  
  def where?
    attrs = [:where_regional, :where_local, :where_rural, :where_urban, :where_urban_centre, :where_neighbourhood]
    select_true_attributes(attrs)
  end
  
  def when?
    attrs = [:when_info_gathering, :when_review, :when_planning, :when_implementing, :when_analyzing, :when_organizing]
    select_true_attributes(attrs)
  end  
  
  def why?
    attrs = [:why_collective_visioning, :why_solution_building, :why_action_planning, :why_community_building, :why_needs_analysis, :why_budgeting, :why_leadership_building, :why_team_building, :why_asset_mapping]
    select_true_attributes(attrs)    
  end
  
  def who?
    attrs = [:who_charity, :who_non_profit, :who_social_enterprise, :who_company, :who_community_economic_development_organization]
    select_true_attributes(attrs)  
  end  
  
protected

  def where_required
    if where?.empty?
      self.errors.add_to_base "You must select one option describing where this tool is used"
      return false
    else
      true
    end
  end
  
  def when_required
    if when?.empty?
      self.errors.add_to_base "You must select one option describing when this tool is used"
      return false
    else
      true
    end
  end  
  
  def why_required
    if why?.empty?
      self.errors.add_to_base("You must select one option describing why this tool is used")     
      return false
    else
      true
    end
  end  
  
  def who_required
    if who?.empty?
      self.errors.add_to_base("You must select one option describing who will use this tool")     
      return false
    else
      true
    end
  end  
end