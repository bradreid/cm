class Tool < ActiveRecord::Base
  has_attached_file :source_document, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"
  
  validates_presence_of :name, :reading_level, :jargon, :steps, :cost_to_obtain, :cost_to_use, :time_to_use, :author, :date_created, :language, :when, :why, :topic
  validates_numericality_of :cost_to_obtain, :cost_to_use, :time_to_use
  validates_uniqueness_of :name
  validate :who_required, :whobeneficiaries_required
  
  before_save :update_time_to_use_as_seconds
  
  def where_question
    JSON.parse(self.where) if self.where
  end
  
  def where_question=(args)
    self.where=args.to_json
  end
  
  def select_true_attributes(attrs)
    attrs.select{|attr| self.send(attr)}.map{|m| m.to_s.gsub(/^[^_]*_/, '')}
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
  
  def update_time_to_use_as_seconds
    self.time_to_use_as_seconds = self.time_to_use.send(self.time_to_use_type.downcase).seconds
  end
end