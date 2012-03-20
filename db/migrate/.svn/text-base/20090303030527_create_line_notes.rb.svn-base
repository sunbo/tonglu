class CreateLineNotes < ActiveRecord::Migration
  def self.up
    create_table :line_notes do |t|
      t.integer :line_place_id
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :line_notes
  end
end
