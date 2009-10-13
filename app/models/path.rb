class Path < ActiveRecord::Base
  acts_as_geom :geom => :line_string

end
