class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessor :login

  has_many :reviews
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :is_admin, :active, :first_name, :last_name,
                  :professional_training_and_accreditation, :years_of_experience, :address, :country, :state_province, :city_town,
                  :organization, :current_role
  
  validates_presence_of :username, :current_role
  validates_uniqueness_of :username
  
  def display_name
    full_name = "#{first_name} #{last_name}".strip
    full_name = self.username if full_name.blank?    
    full_name += ", #{self.current_role}" if self.current_role
    full_name
  end
  
  def display_fields
    [  [:first_name, 'First Name'],
       [:last_name, 'Last Name'],
       [:current_role, 'Current Role/Job Title'],
       [:organization, 'Organization'],
       [:city_town, 'Place of work: City/Town'],
       [:state_province, 'Place of work: State/Province'],
       [:country, 'Country'],
       [:address, 'Address'],
       [:years_of_experience, 'Years of experience in community development'],
       [:professional_training_and_accreditation, 'Professional training or accreditation']
    ]
  end
  
  protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["(lower(username) = :value OR lower(email) = :value) AND active = :active", { :value => login.downcase , :active => true}]).first
  end
    
end
