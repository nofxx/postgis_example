class Region < ActiveRecord::Base
   acts_as_geom :geom => :polygon

end
