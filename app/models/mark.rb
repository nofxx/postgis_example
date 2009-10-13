class Mark < ActiveRecord::Base
  attr_accessor :x, :y
  acts_as_geom :geom => :point


  def before_validation
    self.geom = Point.from_x_y(self.x, self.y)
  end

  validates_presence_of :geom
  validates_presence_of :name


end
