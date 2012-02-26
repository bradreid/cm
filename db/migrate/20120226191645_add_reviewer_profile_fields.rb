class AddReviewerProfileFields < ActiveRecord::Migration
  def self.up
    add_column :users, :current_role, :string
    add_column :users, :organization, :string
    add_column :users, :city_town, :string
    add_column :users, :state_province, :string
    add_column :users, :country, :string
    add_column :users, :address, :text
    add_column :users, :years_of_experience, :string
    add_column :users, :professional_training_and_accreditation, :text
    add_column :users, :memberships_in_community_development, :text
  end

  def self.down
    remove_column :users, :memberships_in_community_development
    remove_column :users, :professional_training_and_accreditation
    remove_column :users, :years_of_experience
    remove_column :users, :address
    remove_column :users, :country
    remove_column :users, :state_province
    remove_column :users, :city_town
    remove_column :users, :organization
    remove_column :users, :current_role
  end
end