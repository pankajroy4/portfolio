# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_03_07_131535) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "bg_images", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "bg_image"
    t.uuid "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_bg_images_on_project_id"
  end

  create_table "certificates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "logo_image"
    t.string "certificate_link", default: "https://www.coursera.org/"
    t.string "alt_name"
    t.string "color_code", default: "#0C9D5899"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitive_sites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "site_name"
    t.string "iconify_classname", default: "simple-icons:hackerearth"
    t.jsonb "style", default: {"color"=>"#323754"}
    t.string "profile_link", default: "https://www.hackerearth.com/@pankaj2290/"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.string "alt_name"
    t.date "start_date"
    t.date "end_date"
    t.jsonb "description", default: ["⚡ I have done B.Tech..", "👉 I have done ..."]
    t.string "website_link", default: "https://www.iitkh.edu/"
    t.integer "position"
    t.string "logo_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "file"
    t.string "document_type"
    t.string "status", default: "inactive"
    t.uuid "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_documents_on_project_id"
  end

  create_table "experiences", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "company_name"
    t.string "company_url"
    t.string "company_logo_image"
    t.text "description"
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.string "logo_color", default: "#000000"
    t.integer "position"
    t.string "experience_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_software_skills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "project_id"
    t.uuid "software_skill_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_software_skills_on_project_id"
    t.index ["software_skill_id"], name: "index_project_software_skills_on_software_skill_id"
  end

  create_table "projects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.string "github_url"
    t.jsonb "other", default: {"live_url"=>"https://neogopingbus.pankajroy.in/"}
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "section_name"
    t.string "section_image"
    t.text "section_svg_data"
    t.string "title"
    t.string "subtitle"
    t.jsonb "button", default: {"to"=>"https://www.github.com", "label"=>"More Projects", "map_embed_src"=>"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1"}
    t.string "description", default: "An enthusiastic problem-solver passionate about developing end-to-end products that drive innovation, sustainability, and long-term scalability, creating impactful solutions that bridge technology and society."
    t.jsonb "others", default: {"email"=>"abc@gmail.com", "phone"=>"+91 1234567890", "typewriter"=>["Full Stack Developer", "Syntax & Stories", "Compiling Dreams"], "wave_emoji"=>"👋", "cursor_style"=>"🔥"}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_name"], name: "index_sections_on_section_name", unique: true
  end

  create_table "site_configurations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "logo_name"
    t.boolean "splash", default: true
    t.string "status", default: "active"
    t.jsonb "seo", default: {"og"=>{"url"=>"http://pankajkumar.info/", "type"=>"website", "title"=>"Pankaj Kumar Portfolio"}, "title"=>"Pankaj's Portfolio", "description"=>"An enthusiastic problem-solver passionate about developing end-to-end products that drive innovation, sustainability, and long-term scalability, creating impactful solutions that bridge technology and society."}
    t.jsonb "menu_items", default: [{"to"=>"/home", "label"=>"Home"}, {"to"=>"/education", "label"=>"Education"}, {"to"=>"/experience", "label"=>"Experience"}, {"to"=>"/projects", "label"=>"Projects"}, {"to"=>"/repoactivity", "label"=>"Repo Activity"}, {"to"=>"/contact", "label"=>"Contact Me"}]
    t.json "address", default: {"locality"=>"Sudama Nagar", "region"=>"Indore", "country"=>"India", "postal_code"=>"452009", "street_address"=>"Gopur Square", "job_title"=>"Software developer", "company_name"=>"Gemsessence Info Tech pvt ltd."}
    t.uuid "theme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theme_id"], name: "index_site_configurations_on_theme_id"
  end

  create_table "skills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "filename"
    t.text "skill_svg_data"
    t.jsonb "skill_highlight", default: ["⚡ Designing highly attractive user interface for mobile and web applications", "⚡ Customizing logo designs and building logos from scratch", "⚡ Creating the flow of application functionalities to optimize user experience"]
    t.string "skill_image"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_media", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "link", default: "https://www.instagram.com/pankajroy.4/"
    t.string "font_aws_icon_class", default: "fa-instagram"
    t.string "bg_hash_code", default: "#E4405F"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "software_skills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "skill_name"
    t.string "font_aws_icon_class", default: "simple-icons:javascript"
    t.jsonb "style", default: {"color"=>"#3776AB", "backgroundColor"=>"transparent"}
    t.integer "position"
    t.uuid "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_software_skills_on_skill_id"
  end

  create_table "themes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "blueTheme"
    t.string "body", default: "#EDF9FE"
    t.string "text", default: "#001C55"
    t.string "exp_txt_color", default: "#000a12"
    t.string "highlight", default: "#A6E1FA"
    t.string "dark", default: "#00072D"
    t.string "secondary_text", default: "#7F8DAA"
    t.string "image_highlight", default: "#0E6BA8"
    t.string "comp_img_highlight", default: "#E6E6E6"
    t.string "jacket_color", default: "#0A2472"
    t.string "header_color", default: "#0E6BA877"
    t.string "splash_bg", default: "#001C55"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "role", default: "", null: false
    t.string "profile_image"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "bg_images", "projects"
  add_foreign_key "documents", "projects"
  add_foreign_key "project_software_skills", "projects"
  add_foreign_key "project_software_skills", "software_skills"
  add_foreign_key "site_configurations", "themes"
  add_foreign_key "software_skills", "skills"
end
