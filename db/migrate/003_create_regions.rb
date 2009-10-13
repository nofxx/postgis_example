class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name
      t.polygon :geom, :srid => 4326, :null => false

      t.timestamps
    end

    add_index :regions, :name
    add_index :regions, :geom, :spatial => true
  end

  def self.down
    drop_table :regions
  end
end
