class Tool < ActiveRecord::Base
  has_attached_file :source_document, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"
  
  validates_presence_of :name, :author, :language, :when, :why, :topic, :description, :copyright, :source_url
  validates_uniqueness_of :name
  
  def where_question
    JSON.parse(self.where) if self.where
  end
  
  def where_question=(args)
    self.where=args.to_json
  end
  
  def select_true_attributes(attrs)
    attrs.select{|attr| self.send(attr)}.map{|m| m.to_s.gsub(/^[^_]*_/, '')}
  end 
end