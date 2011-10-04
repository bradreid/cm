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

ActiveRecord::Schema.define(:version => 20111002010201) do

  create_table "tools", :force => true do |t|
    t.string   "name"
    t.string   "method_of_access"
    t.float    "cost_to_use"
    t.float    "cost_to_obtain"
    t.integer  "time_to_use"
    t.string   "other_resources_needed"
    t.string   "electronics_equipment"
    t.string   "software"
    t.string   "activities_involved"
    t.string   "expertise_needed"
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
    t.boolean  "when_reviewing"
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
    t.boolean  "why_impact_analysis"
    t.boolean  "why_environmental_analysis"
    t.boolean  "why_committee_analysis"
    t.boolean  "why_visioning"
    t.boolean  "why_project_management_control"
    t.boolean  "why_project_management_monitoring"
    t.boolean  "why_whole_community_planning"
    t.boolean  "why_cost_benefit_analysis"
    t.boolean  "why_physical_environment_analysis"
    t.boolean  "why_community_profile_analysis"
    t.boolean  "why_community_indicator_analysis"
    t.boolean  "empowerment"
    t.boolean  "why_proverty_reduction"
    t.boolean  "why_physical_environment"
    t.boolean  "why_community_event"
    t.boolean  "why_budget_review"
    t.boolean  "where_municipal"
    t.boolean  "where_inter_provincial"
    t.boolean  "where_northern"
    t.boolean  "where_agricultural"
    t.boolean  "where_resource_based"
    t.boolean  "where_boom_bust"
    t.boolean  "where_declining"
    t.boolean  "who_ced_practicioner"
    t.boolean  "who_ced_service_organization"
    t.boolean  "who_community_based_service"
    t.boolean  "who_organization"
    t.boolean  "who_volunteer_groups"
    t.boolean  "focus_social"
    t.boolean  "focus_economic"
    t.boolean  "focus_environmental"
    t.boolean  "focus_sustainable"
    t.boolean  "where_provincial"
    t.boolean  "whobeneficiaries_first_nations"
    t.boolean  "whobeneficiaries_metis"
    t.boolean  "whobeneficiaries_youth"
    t.boolean  "whobeneficiaries_seniors"
    t.boolean  "whobeneficiaries_women"
  end

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
