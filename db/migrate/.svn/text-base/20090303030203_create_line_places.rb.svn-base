class CreateLinePlaces < ActiveRecord::Migration
  def self.up
    create_table :line_places do |t|
      t.integer :line_id
      t.datetime :date
      t.string :place
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table :line_places
  end
end
