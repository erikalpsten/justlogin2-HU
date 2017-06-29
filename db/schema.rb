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

ActiveRecord::Schema.define(version: 20170615074132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments_policies", force: :cascade do |t|
    t.integer "refinery_policy_id"
    t.integer "refinery_policy_attachment_id"
  end

  add_index "attachments_policies", ["refinery_policy_id", "refinery_policy_attachment_id"], name: "attachments_policies_index", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "refinery_authentication_devise_roles", force: :cascade do |t|
    t.string "title"
  end

  create_table "refinery_authentication_devise_roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "refinery_authentication_devise_roles_users", ["role_id", "user_id"], name: "refinery_roles_users_role_id_user_id", using: :btree
  add_index "refinery_authentication_devise_roles_users", ["user_id", "role_id"], name: "refinery_roles_users_user_id_role_id", using: :btree

  create_table "refinery_authentication_devise_user_plugins", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
    t.integer "position"
  end

  add_index "refinery_authentication_devise_user_plugins", ["name"], name: "index_refinery_authentication_devise_user_plugins_on_name", using: :btree
  add_index "refinery_authentication_devise_user_plugins", ["user_id", "name"], name: "refinery_user_plugins_user_id_name", unique: true, using: :btree

  create_table "refinery_authentication_devise_users", force: :cascade do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "encrypted_password",     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "sign_in_count"
    t.datetime "remember_created_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "full_name"
    t.string   "comapany"
    t.string   "phone"
  end

  add_index "refinery_authentication_devise_users", ["id"], name: "index_refinery_authentication_devise_users_on_id", using: :btree
  add_index "refinery_authentication_devise_users", ["slug"], name: "index_refinery_authentication_devise_users_on_slug", using: :btree

  create_table "refinery_image_translations", force: :cascade do |t|
    t.integer  "refinery_image_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "image_alt"
    t.string   "image_title"
  end

  add_index "refinery_image_translations", ["locale"], name: "index_refinery_image_translations_on_locale", using: :btree
  add_index "refinery_image_translations", ["refinery_image_id"], name: "index_refinery_image_translations_on_refinery_image_id", using: :btree

  create_table "refinery_images", force: :cascade do |t|
    t.string   "image_mime_type"
    t.string   "image_name"
    t.integer  "image_size"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_title"
    t.string   "image_alt"
  end

  create_table "refinery_page_part_translations", force: :cascade do |t|
    t.integer  "refinery_page_part_id", null: false
    t.string   "locale",                null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.text     "body"
  end

  add_index "refinery_page_part_translations", ["locale"], name: "index_refinery_page_part_translations_on_locale", using: :btree
  add_index "refinery_page_part_translations", ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id", using: :btree

  create_table "refinery_page_parts", force: :cascade do |t|
    t.integer  "refinery_page_id"
    t.string   "slug"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "refinery_page_parts", ["id"], name: "index_refinery_page_parts_on_id", using: :btree
  add_index "refinery_page_parts", ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id", using: :btree

  create_table "refinery_page_translations", force: :cascade do |t|
    t.integer  "refinery_page_id", null: false
    t.string   "locale",           null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "title"
    t.string   "custom_slug"
    t.string   "menu_title"
    t.string   "slug"
  end

  add_index "refinery_page_translations", ["locale"], name: "index_refinery_page_translations_on_locale", using: :btree
  add_index "refinery_page_translations", ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id", using: :btree

  create_table "refinery_pages", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "path"
    t.string   "slug"
    t.string   "custom_slug"
    t.boolean  "show_in_menu",        default: true
    t.string   "link_url"
    t.string   "menu_match"
    t.boolean  "deletable",           default: true
    t.boolean  "draft",               default: false
    t.boolean  "skip_to_first_child", default: false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "view_template"
    t.string   "layout_template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_pages", ["depth"], name: "index_refinery_pages_on_depth", using: :btree
  add_index "refinery_pages", ["id"], name: "index_refinery_pages_on_id", using: :btree
  add_index "refinery_pages", ["lft"], name: "index_refinery_pages_on_lft", using: :btree
  add_index "refinery_pages", ["parent_id"], name: "index_refinery_pages_on_parent_id", using: :btree
  add_index "refinery_pages", ["rgt"], name: "index_refinery_pages_on_rgt", using: :btree

  create_table "refinery_policies", force: :cascade do |t|
    t.string   "name"
    t.integer  "logo_id"
    t.string   "insurer"
    t.decimal  "premium"
    t.integer  "benefit_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "employee_id"
    t.integer  "claim_id"
    t.string   "advisor_name"
    t.date     "start_date"
    t.date     "expiry_date"
  end

  add_index "refinery_policies", ["benefit_id"], name: "index_refinery_policies_on_benefit_id", using: :btree

  create_table "refinery_policies_attachments", force: :cascade do |t|
    t.integer  "file_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_policies_claims", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_policies_employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_policies_policy_feature_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_policies_policy_features", force: :cascade do |t|
    t.string   "name"
    t.integer  "policy_feature_group_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_policies_policy_features", ["policy_feature_group_id"], name: "policy_feature_group_id_idx", using: :btree

  create_table "refinery_policies_policy_features_policies", force: :cascade do |t|
    t.integer  "policy_feature_id"
    t.integer  "policy_id"
    t.string   "value"
    t.boolean  "is_in_summary"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_policies_policy_features_policies", ["policy_feature_id", "policy_id"], name: "policy_feature_policy_idx", using: :btree

  create_table "refinery_products", force: :cascade do |t|
    t.string   "name"
    t.integer  "logo_id"
    t.string   "insurer"
    t.decimal  "premium",    precision: 8, scale: 2
    t.string   "special"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "benefit_id"
  end

  create_table "refinery_products_benefits", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "source"
    t.text     "feature_summary"
    t.text     "feature"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_name"
    t.string   "slug"
  end

  create_table "refinery_products_benefits_user_submissions", force: :cascade do |t|
    t.integer "benefit_id"
    t.integer "user_submission_id"
  end

  add_index "refinery_products_benefits_user_submissions", ["benefit_id", "user_submission_id"], name: "products_benefit_id_user_submission_id", using: :btree

  create_table "refinery_products_employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_products_feature_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_products_plans", force: :cascade do |t|
    t.string   "icon_name"
    t.string   "name"
    t.string   "description"
    t.string   "definition"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_products_product_features", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feature_group_id"
  end

  add_index "refinery_products_product_features", ["feature_group_id"], name: "index_refinery_products_product_features_on_feature_group_id", using: :btree

  create_table "refinery_products_product_features_products", force: :cascade do |t|
    t.integer  "product_feature_id"
    t.integer  "product_id"
    t.string   "value"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_in_summary"
  end

  add_index "refinery_products_product_features_products", ["product_feature_id", "product_id"], name: "product_feature_product_idx", using: :btree

  create_table "refinery_products_products_user_submissions", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_submission_id"
  end

  add_index "refinery_products_products_user_submissions", ["product_id", "user_submission_id"], name: "products_product_id_user_submission_id", using: :btree

  create_table "refinery_products_user_submissions", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company"
    t.string   "phone_number"
    t.string   "other_inquiries"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_resource_translations", force: :cascade do |t|
    t.integer  "refinery_resource_id", null: false
    t.string   "locale",               null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "resource_title"
  end

  add_index "refinery_resource_translations", ["locale"], name: "index_refinery_resource_translations_on_locale", using: :btree
  add_index "refinery_resource_translations", ["refinery_resource_id"], name: "index_refinery_resource_translations_on_refinery_resource_id", using: :btree

  create_table "refinery_resources", force: :cascade do |t|
    t.string   "file_mime_type"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_uid"
    t.string   "file_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_settings", force: :cascade do |t|
    t.string   "name"
    t.text     "value"
    t.boolean  "destroyable",     default: true
    t.string   "scoping"
    t.boolean  "restricted",      default: false
    t.string   "form_value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "title"
  end

  add_index "refinery_settings", ["name"], name: "index_refinery_settings_on_name", using: :btree

  create_table "seo_meta", force: :cascade do |t|
    t.integer  "seo_meta_id"
    t.string   "seo_meta_type"
    t.string   "browser_title"
    t.text     "meta_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "seo_meta", ["id"], name: "index_seo_meta_on_id", using: :btree
  add_index "seo_meta", ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta", using: :btree

end
