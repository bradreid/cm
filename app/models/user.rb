class User < ActiveRecord::Base
  include ActionView::Helpers::TranslationHelper
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessor :login

  has_many :reviews, :order => :id
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :is_admin, :active, :first_name, :last_name,
                  :professional_training_and_accreditation, :years_of_experience, :address, :country, :state_province, :city_town,
                  :organization, :current_role, :email_new_tools, :email_new_reviews, :email_new_user
  
  validates_presence_of :username, :current_role
  validates_uniqueness_of :username
  
  after_create :send_welcome_emails
  before_save :set_user_description
  
  def display_name
    full_name = "#{first_name} #{last_name}".strip
    full_name = self.username if full_name.blank?    
    full_name += ", #{self.current_role}" if self.current_role
    full_name
  end
  
  def display_fields
    [  [:first_name, t(:field_first,:scope=>[:viewuser])],
       [:last_name, t(:field_last,:scope=>[:viewuser])],
       [:current_role, t(:field_role,:scope=>[:viewuser])], 
       [:organization, t(:field_org,:scope=>[:viewuser])],
       [:city_town, t(:field_city,:scope=>[:viewuser])],
       [:state_province, t(:field_state,:scope=>[:viewuser])],
       [:country, t(:field_country,:scope=>[:viewuser])],
       [:address, t(:field_address,:scope=>[:viewuser])],
       [:years_of_experience, t(:field_years,:scope=>[:viewuser])],
       [:professional_training_and_accreditation, t(:field_prof,:scope=>[:viewuser])]
    ]
  end
  
protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["(lower(username) = :value OR lower(email) = :value) AND active = :active", { :value => login.downcase , :active => true}]).first
  end

  def send_welcome_emails
    Notifier.delay.welcome(self)
    Notifier.delay.new_user(self)
  end    
  
  def set_user_description
    self.user_description = "#{first_name} #{last_name} #{username} #{current_role} #{organization}"
  end
end
