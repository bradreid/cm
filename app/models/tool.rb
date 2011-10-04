class Tool < ActiveRecord::Base
  has_attached_file :source_document, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"
  
  validates_presence_of :name, :focus, :reading_level, :jargon, :steps, :cost_to_obtain, :cost_to_use, :time_to_use, :author, :date_created, :language
  validates_numericality_of :cost_to_obtain, :cost_to_use, :time_to_use
  validates_uniqueness_of :name
  validate :where_required, :when_required, :why_required, :who_required, :whobeneficiaries_required, :focus_required
  
  def select_true_attributes(attrs)
    attrs.select{|attr| self.send(attr)}.map{|m| m.to_s.gsub(/^[^_]*_/, '')}
  end
  
  def where_attrs
    attrs = self.methods.select {|v| v =~ /where_.*changed\?/}.map{|s| s.to_s.gsub(/_changed\?/, '')} - ['where']
  end
  
  def where?
    select_true_attributes(where_attrs)
  end
  
  def when
    self.methods.select {|v| v =~ /when_.*changed\?/}.map{|s| s.to_s.gsub(/_changed\?/, '')}    
  end  
  
  def when?
    select_true_attributes(self.when)
  end
  
  def focus
    self.methods.select {|v| v =~ /focus_.*changed\?/}.map{|s| s.to_s.gsub(/_changed\?/, '')}    
  end  
  
  def focus?
    select_true_attributes(self.focus)
  end  
  
  def why?
    select_true_attributes(why)     
  end
  
  def why
    self.methods.select {|v| v =~ /why_.*changed\?/}.map{|s| s.to_s.gsub(/_changed\?/, '')}
  end
  
  def who
    self.methods.select {|v| v =~ /who_.*changed\?/}.map{|s| s.to_s.gsub(/_changed\?/, '')}
  end 
  
  def who?
    select_true_attributes(self.who)  
  end
  
  def whobeneficiaries
    self.methods.select {|v| v =~ /whobeneficiaries_.*changed\?/}.map{|s| s.to_s.gsub(/_changed\?/, '')}
  end 
  
  def whobeneficiaries?
    select_true_attributes(self.whobeneficiaries)  
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
  
  def whobeneficiaries_required
    if whobeneficiaries?.empty?
      self.errors.add_to_base("You must select one option describing who will benefit from ths use of this tool")     
      return false
    else
      true
    end
  end  
end