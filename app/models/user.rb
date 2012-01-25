class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessor :login

  has_many :reviews
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login, :is_admin, :active, :first_name, :last_name
  
  validates_presence_of :username, :first_name, :last_name
  validates_uniqueness_of :username
  
  def display_name
    full_name = "#{first_name} #{last_name}"
    full_name = self.username if full_name.blank?
    full_name
  end
  
  protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["(lower(username) = :value OR lower(email) = :value) AND active = :active", { :value => login.downcase , :active => true}]).first
  end
    
end
