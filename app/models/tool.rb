class Tool < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
    
  has_attached_file :source_document, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :path => "/:style/:filename"
  
  validates_presence_of :name, :source_document_name, :source_url, :author, :language, :description, :when, :why, :topic, :copyright
  validates_uniqueness_of :name
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by'
  has_many :reviews, :dependent => :destroy 
  
  after_create :send_email
  
  def recalc_stars
    Tool.transaction do
      self.lock!
      self.rating_count = 0
      self.rating_total = 0.0
      self.rating = 0.0
      self.save!
      self.reviews.active.each{|r| self.add_rating(r.rating) }
    end
      
  end

  def add_rating(rating)
    Tool.transaction do
      self.lock!
      self.rating_count ||= 0
      self.rating_total ||= 0.0
      self.rating_count += 1
      self.rating_total += rating
      self.rating = self.rating_total/self.rating_count
      self.save!
    end
  end
  
  def twitter_message
    begin
      b = Bitly.new('symingtonroad', 'R_50ed08c79b7d216360e2403ac3000528')
      url = Rails.application.routes.url_helpers.tool_url('en', self, :host => Rails.configuration.app_domain) 
      short = b.shorten(url)
      text = "New Tool: #{self.name}"[0..125]
      "#{text} #{short.short_url}"     
    rescue Exception => e
      nil
    end    
  end  
  
private

  def send_email
    Notifier.delay.new_tool(self)
  end
end