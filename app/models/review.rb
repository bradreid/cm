class Review < ActiveRecord::Base
  
  validates_presence_of :tool_id, :community_context, :generates_results, :resources_identified, :format_presentation, :adaptable
  validates_presence_of :full_name, :role , :unless =>'user.present?'
  belongs_to :tool
  belongs_to :user
  before_save :add_rating
  after_save :update_tool_stars
  after_create :send_email
  
  scope :active, :conditions => {:active => true}
  scope :active_by_user, lambda { |user_id| {:conditions => ["active = ? OR user_id = ?", true, user_id]} }
  scope :inactive_by_user, lambda { |user_id| {:conditions => ["active = ? OR user_id = ?", false, user_id]} }  
  
  def text
    c = [self.comment, self.community_context_comment, self.generates_results_comment, self.resources_identified_comment, self.format_presentation_comment, self.adaptable_comment]
    c.compact.join('. ').gsub(/\.\./, '.')[0..250]
  end
  
  def twitter_message
    begin
      b = Bitly.new('symingtonroad', 'R_50ed08c79b7d216360e2403ac3000528')
      url = Rails.application.routes.url_helpers.tool_review_url('en', self.tool,self, :host => Rails.configuration.app_domain) 
      short = b.shorten(url)
      text = "#{self.rating} stars,  #{self.tool.name}"[0..125]
      "#{text} #{short.short_url}"     
    rescue Exception => e
      nil
    end    
  end  
   
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
  
  def send_email
    Notifier.new_review(self).deliver
  end  
end
