class AddReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews, :force => true do |t|
      t.integer :tool_id
      t.string :name
      t.string :organization
      t.string :current_role
      t.integer :years_of_experience
      t.text :accreditations
      t.text :memberships
      t.boolean :tool_used
      t.integer :goal_clear
      t.integer :tasks_easy_to_understand
      t.integer :additional_requirements_clear
      t.integer :tasks_eash_to_implement
      t.integer :tasks_achieve_goal
      t.integer :additional_resources_required_for_goal
      t.integer :easily_adapted
      t.integer :easily_adapted_cultural
      t.integer :easily_merged
      t.text :comments
      t.text :over_all_impressions
      t.integer :insightful_resource
      t.integer :perfect_to_use_as_presented
      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end