class CreateMarks < ActiveRecord::Migration
  def self.up
    create_table :marks do |t|
      t.string :name
      t.point :geom, :srid => 4326, :null => false

      t.timestamps
    end

    add_index :marks, :name
    add_index :marks, :geom, :spatial => true
  end

  def self.down
    drop_table :marks
  end
end
