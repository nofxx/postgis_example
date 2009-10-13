# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 3) do

  create_table "marks", :force => true do |t|
    t.column "name", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "geom", :point, :srid => 4326, :null => false
  end

  add_index "marks", ["geom"], :name => "index_marks_on_geom", :spatial=> true 
  add_index "marks", ["name"], :name => "index_marks_on_name"

  create_table "paths", :force => true do |t|
    t.column "name", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "geom", :line_string, :srid => 4326, :null => false
  end

  add_index "paths", ["geom"], :name => "index_paths_on_geom", :spatial=> true 
  add_index "paths", ["name"], :name => "index_paths_on_name"

  create_table "regions", :force => true do |t|
    t.column "name", :string
    t.column "created_at", :datetime
    t.column "updated_at", :datetime
    t.column "geom", :polygon, :srid => 4326, :null => false
  end

  add_index "regions", ["geom"], :name => "index_regions_on_geom", :spatial=> true 
  add_index "regions", ["name"], :name => "index_regions_on_name"

end
