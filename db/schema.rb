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

ActiveRecord::Schema.define(:version => 20111103014835) do

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

  create_table "tools", :force => true do |t|
    t.string   "name"
    t.string   "expertise_needed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "where",                        :limit => 255
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
  add_index "tools", ["name"], :name => "index_tools_on_name"
  add_index "tools", ["when"], :name => "index_tools_on_when"
  add_index "tools", ["why"], :name => "index_tools_on_why"

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
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
