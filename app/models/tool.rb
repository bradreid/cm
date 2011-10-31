class Tool < ActiveRecord::Base
  has_attached_file :source_document, :storage => :s3, :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "/:style/:filename"
  
  validates_presence_of :name, :source_document_name, :source_url, :author, :language, :description, :when, :why, :topic, :copyright
  validates_uniqueness_of :name
  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by'
  has_many :reviews

end