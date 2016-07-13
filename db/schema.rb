# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160713101917) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "asset_attributes", force: :cascade do |t|
    t.string   "name"
    t.integer  "asset_type_id"
    t.integer  "asset_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.hstore   "asset_attributes"
  end

  add_index "asset_attributes", ["asset_id"], name: "index_asset_attributes_on_asset_id", using: :btree
  add_index "asset_attributes", ["asset_type_id"], name: "index_asset_attributes_on_asset_type_id", using: :btree

  create_table "asset_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "parent_type_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "ancestry"
    t.boolean  "has_child",                default: false
    t.hstore   "private_asset_attributes"
  end

  add_index "asset_types", ["ancestry"], name: "index_asset_types_on_ancestry", using: :btree
  add_index "asset_types", ["parent_type_id"], name: "index_asset_types_on_parent_type_id", using: :btree

  create_table "assets", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "asset_type_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "location_id"
    t.string   "department"
    t.string   "manufactured_by"
    t.string   "display_name"
    t.integer  "impact"
    t.integer  "company_id"
    t.hstore   "private_asset_attributes"
    t.integer  "tenant_id"
  end

  add_index "assets", ["asset_type_id"], name: "index_assets_on_asset_type_id", using: :btree
  add_index "assets", ["company_id"], name: "index_assets_on_company_id", using: :btree
  add_index "assets", ["location_id"], name: "index_assets_on_location_id", using: :btree
  add_index "assets", ["tenant_id"], name: "index_assets_on_tenant_id", using: :btree

  create_table "assignment_informations", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "managed_by"
    t.string   "department"
    t.string   "used_by"
    t.integer  "asset_id"
    t.datetime "assigned_on"
    t.string   "attached_file"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "assignment_informations", ["asset_id"], name: "index_assignment_informations_on_asset_id", using: :btree
  add_index "assignment_informations", ["location_id"], name: "index_assignment_informations_on_location_id", using: :btree

  create_table "aws_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "company_zip"
    t.string   "company_phone"
    t.string   "company_phone_extension"
    t.integer  "number_of_employees"
    t.integer  "user_id"
    t.boolean  "terms_of_services"
    t.string   "company_type"
    t.string   "filepicker_url"
    t.string   "name"
    t.integer  "tenant_id"
  end

  add_index "companies", ["tenant_id"], name: "index_companies_on_tenant_id", using: :btree
  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "company_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "company_users", ["company_id"], name: "index_company_users_on_company_id", using: :btree
  add_index "company_users", ["user_id"], name: "index_company_users_on_user_id", using: :btree

  create_table "contract_attachments", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.integer  "contract_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "attached_file_file_name"
    t.string   "attached_file_content_type"
    t.integer  "attached_file_file_size"
    t.datetime "attached_file_updated_at"
  end

  add_index "contract_attachments", ["contract_id"], name: "index_contract_attachments_on_contract_id", using: :btree

  create_table "contract_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tenant_id"
  end

  add_index "contract_categories", ["tenant_id"], name: "index_contract_categories_on_tenant_id", using: :btree

  create_table "contracts", force: :cascade do |t|
    t.string   "supplier"
    t.datetime "alert_date"
    t.string   "reference"
    t.integer  "contract_value_type"
    t.integer  "contract_value_amount"
    t.datetime "start_date"
    t.integer  "notice_period"
    t.datetime "end_date"
    t.string   "notes"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "company_id"
    t.integer  "contract_category_id"
    t.integer  "primary_contact"
    t.integer  "tenant_id"
  end

  add_index "contracts", ["company_id"], name: "index_contracts_on_company_id", using: :btree
  add_index "contracts", ["contract_category_id"], name: "index_contracts_on_contract_category_id", using: :btree
  add_index "contracts", ["tenant_id"], name: "index_contracts_on_tenant_id", using: :btree

  create_table "costs", force: :cascade do |t|
    t.integer  "cost"
    t.float    "salvage"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "costs", ["asset_id"], name: "index_costs_on_asset_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "employee_file_records", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "file_form_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "employee_file_records", ["employee_id"], name: "index_employee_file_records_on_employee_id", using: :btree
  add_index "employee_file_records", ["file_form_id"], name: "index_employee_file_records_on_file_form_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "title"
    t.string   "zipcode"
    t.string   "department"
    t.integer  "user_id"
    t.integer  "supervisor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "company_id"
    t.integer  "location_id"
    t.integer  "employee_type"
    t.integer  "tenant_id"
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id", using: :btree
  add_index "employees", ["location_id"], name: "index_employees_on_location_id", using: :btree
  add_index "employees", ["supervisor_id"], name: "index_employees_on_supervisor_id", using: :btree
  add_index "employees", ["tenant_id"], name: "index_employees_on_tenant_id", using: :btree
  add_index "employees", ["user_id"], name: "index_employees_on_user_id", using: :btree

  create_table "file_forms", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "attachment"
    t.boolean  "response_required"
    t.integer  "employee_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "company_id"
    t.integer  "file_type_id"
    t.integer  "tenant_id"
  end

  add_index "file_forms", ["company_id"], name: "index_file_forms_on_company_id", using: :btree
  add_index "file_forms", ["employee_id"], name: "index_file_forms_on_employee_id", using: :btree
  add_index "file_forms", ["file_type_id"], name: "index_file_forms_on_file_type_id", using: :btree
  add_index "file_forms", ["tenant_id"], name: "index_file_forms_on_tenant_id", using: :btree

  create_table "file_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "help_tickets", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "help_paragraph"
    t.integer  "company_id"
    t.integer  "parent_ticket_id"
    t.integer  "creator_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "help_tickets", ["company_id"], name: "index_help_tickets_on_company_id", using: :btree
  add_index "help_tickets", ["creator_id"], name: "index_help_tickets_on_creator_id", using: :btree
  add_index "help_tickets", ["parent_ticket_id"], name: "index_help_tickets_on_parent_ticket_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "phone_number"
    t.integer  "company_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "country_name"
  end

  add_index "locations", ["company_id"], name: "index_locations_on_company_id", using: :btree

  create_table "message_users", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "message_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "cc_id"
    t.integer  "receiver_status"
    t.integer  "sender_status"
  end

  add_index "message_users", ["cc_id"], name: "index_message_users_on_cc_id", using: :btree
  add_index "message_users", ["message_id"], name: "index_message_users_on_message_id", using: :btree
  add_index "message_users", ["receiver_id"], name: "index_message_users_on_receiver_id", using: :btree
  add_index "message_users", ["sender_id"], name: "index_message_users_on_sender_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "subject"
    t.string   "message_body"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "attachment"
  end

  create_table "printer_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privileges", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "privileges", ["user_id"], name: "index_privileges_on_user_id", using: :btree

  create_table "product_vendors", force: :cascade do |t|
    t.integer  "vendor_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_vendors", ["product_id"], name: "index_product_vendors_on_product_id", using: :btree
  add_index "product_vendors", ["vendor_id"], name: "index_product_vendors_on_vendor_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "request_params", force: :cascade do |t|
    t.string   "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "name"
    t.string   "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "work_phone"
    t.string   "mobile_phone"
    t.string   "address"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.integer  "role"
    t.string   "auth_token",             default: ""
    t.string   "roles"
    t.integer  "tenant_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["tenant_id"], name: "index_users_on_tenant_id", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "asset_attributes", "asset_types"
  add_foreign_key "asset_attributes", "assets"
  add_foreign_key "assets", "asset_types"
  add_foreign_key "assets", "companies"
  add_foreign_key "assets", "locations"
  add_foreign_key "assignment_informations", "assets"
  add_foreign_key "assignment_informations", "locations"
  add_foreign_key "companies", "users"
  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "contract_attachments", "contracts"
  add_foreign_key "contract_categories", "tenants"
  add_foreign_key "contracts", "companies"
  add_foreign_key "contracts", "contract_categories"
  add_foreign_key "costs", "assets"
  add_foreign_key "employee_file_records", "employees"
  add_foreign_key "employee_file_records", "file_forms"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "locations"
  add_foreign_key "employees", "users"
  add_foreign_key "file_forms", "companies"
  add_foreign_key "file_forms", "employees"
  add_foreign_key "file_forms", "file_types"
  add_foreign_key "help_tickets", "companies"
  add_foreign_key "locations", "companies"
  add_foreign_key "message_users", "messages"
  add_foreign_key "privileges", "users"
  add_foreign_key "product_vendors", "products"
  add_foreign_key "product_vendors", "vendors"
end
