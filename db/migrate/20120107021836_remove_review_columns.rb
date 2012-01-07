class RemoveReviewColumns < ActiveRecord::Migration
  def self.up
    drop_table :reviews
    create_table :reviews, :force => true do |t|
      t.integer :user_id
      t.integer :tool_id
      t.string :experience
      t.integer :community_context
      t.text :community_context_comment
      t.integer :generates_results
      t.text :generates_results_comment
      t.integer :resources_identified
      t.text :resources_identified_comment
      t.integer :format_presentation
      t.text :format_presentation_comment
      t.integer :adaptable
      t.text :adaptable_comment
      t.text :comment
      t.integer :rating
      t.timestamps
    end
    add_index :reviews, :tool_id
  end

  def self.down
    drop_table :reviews
    create_table "reviews", :force => true do |t|
      t.integer  "tool_id"
      t.string   "name"
      t.string   "organization"
      t.string   "current_role"
      t.integer  "years_of_experience"
      t.text     "accreditations"
      t.text     "memberships"
      t.string   "tool_used"
      t.integer  "goal_clear"
      t.integer  "tasks_easy_to_understand"
      t.integer  "additional_requirements_clear"
      t.integer  "tasks_easy_to_implement"
      t.integer  "tasks_achieve_goal"
      t.integer  "additional_resources_required_for_goal"
      t.integer  "easily_adapted"
      t.integer  "easily_adapted_cultural"
      t.integer  "easily_merged"
      t.text     "comments"
      t.text     "over_all_impressions"
      t.integer  "insightful_resource"
      t.integer  "perfect_to_use_as_presented"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.float    "rating"
    end    
    add_index :reviews, :tool_id
  end
end