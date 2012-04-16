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

ActiveRecord::Schema.define(:version => 20120226195230) do

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "tool_id"
    t.string   "experience"
    t.integer  "community_context"
    t.text     "community_context_comment"
    t.integer  "generates_results"
    t.text     "generates_results_comment"
    t.integer  "resources_identified"
    t.text     "resources_identified_comment"
    t.integer  "format_presentation"
    t.text     "format_presentation_comment"
    t.integer  "adaptable"
    t.text     "adaptable_comment"
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                       :default => true
  end

  add_index "reviews", ["tool_id"], :name => "index_reviews_on_tool_id"

  create_table "tools", :force => true do |t|
    t.string   "name"
    t.string   "expertise_needed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "where"
    t.string   "author"
    t.date     "date_created"
    t.string   "language"
    t.text     "description"
    t.string   "source_document_file_name"
    t.string   "source_document_content_type"
    t.integer  "source_document_file_size"
    t.datetime "source_document_updated_at"
    t.float    "rating"
    t.boolean  "empowerment"
    t.integer  "time_to_use_as_seconds"
    t.string   "source_document_name"
    t.string   "editor"
    t.string   "publisher"
    t.string   "when"
    t.string   "why"
    t.string   "where_created"
    t.string   "topic"
    t.string   "who"
    t.string   "special_equipment_facilities"
    t.string   "copyright"
    t.string   "copyright_holder"
    t.string   "copyright_restrictions"
    t.string   "copyright_permissions"
    t.string   "source_url"
    t.integer  "created_by"
    t.text     "comments"
    t.integer  "rating_count"
    t.float    "rating_total"
  end

  add_index "tools", ["description"], :name => "index_tools_on_description"
  add_index "tools", ["when"], :name => "index_tools_on_when"
  add_index "tools", ["why"], :name => "index_tools_on_why"

  create_table "users", :force => true do |t|
    t.string   "email",                                                  :default => "",   :null => false
    t.string   "encrypted_password",                      :limit => 128, :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "is_admin"
    t.boolean  "active",                                                 :default => true
    t.string   "first_name"
    t.string   "last_name"
    t.string   "current_role"
    t.string   "organization"
    t.string   "city_town"
    t.string   "state_province"
    t.string   "country"
    t.text     "address"
    t.string   "years_of_experience"
    t.text     "professional_training_and_accreditation"
    t.text     "memberships_in_community_development"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
