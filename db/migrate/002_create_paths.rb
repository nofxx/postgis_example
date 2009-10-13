class CreatePaths < ActiveRecord::Migration
  def self.up
    create_table :paths do |t|
      t.string :name
      t.line_string :geom, :srid => 4326, :null => false
      t.timestamps
    end

    add_index :paths, :name
    add_index :paths, :geom, :spatial => true
  end

  def self.down
    drop_table :paths
  end
end
