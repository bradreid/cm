# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110926012715) do

  create_table "models", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "models", ["email"], :name => "index_models_on_email", :unique => true
  add_index "models", ["reset_password_token"], :name => "index_models_on_reset_password_token", :unique => true

  create_table "tools", :force => true do |t|
    t.string   "name"
    t.float    "cost_to_obtain"
    t.float    "cost_to_use"
    t.integer  "time_to_use"
    t.text     "other_resources_needed"
    t.text     "electronics_equipment"
    t.text     "software"
    t.text     "method_of_access"
    t.text     "activities_involved"
    t.text     "expertise_needed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reading_level"
    t.string   "jargon"
    t.string   "steps"
    t.string   "where"
    t.boolean  "where_regional"
    t.boolean  "where_local"
    t.boolean  "where_rural"
    t.boolean  "where_urban"
    t.boolean  "where_urban_centre"
    t.boolean  "where_neighbourhood"
    t.boolean  "when_info_gathering"
    t.boolean  "when_review"
    t.boolean  "when_planning"
    t.boolean  "when_implementing"
    t.boolean  "when_analyzing"
    t.boolean  "when_organizing"
    t.boolean  "why_collective_visioning"
    t.boolean  "why_solution_building"
    t.boolean  "why_action_planning"
    t.boolean  "why_community_capacity_building"
    t.boolean  "why_needs_analysis"
    t.boolean  "why_budgeting"
    t.boolean  "why_leadership_capacity_building"
    t.boolean  "why_asset_mapping"
    t.string   "time_to_use_type"
    t.boolean  "who_charity"
    t.boolean  "who_non_profit"
    t.boolean  "who_social_enterprise"
    t.boolean  "who_company"
    t.boolean  "who_community_economic_development_organization"
    t.string   "author"
    t.date     "date_created"
    t.string   "language"
    t.string   "relevant_pages"
    t.integer  "total_pages"
    t.text     "description"
    t.string   "source_document_file_name"
    t.string   "source_document_content_type"
    t.integer  "source_document_file_size"
    t.datetime "source_document_updated_at"
    t.float    "rating"
    t.string   "focus"
    t.boolean  "why_asset_acquisition"
    t.boolean  "why_asset_mobilization"
    t.boolean  "why_economic_assesment"
    t.boolean  "why_institutional_assessment"
    t.boolean  "why_environmental_impact_assessment"
    t.boolean  "why_poverty_assessment"
    t.boolean  "why_project_assessment"
    t.boolean  "why_communications_development"
    t.boolean  "why_community_economic_development"
    t.boolean  "why_community_development"
    t.boolean  "why_partnership_building"
    t.boolean  "why_leadership_building"
  end

  add_index "tools", ["name"], :name => "index_tools_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
