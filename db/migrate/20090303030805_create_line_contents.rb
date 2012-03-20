class CreateLineContents < ActiveRecord::Migration
  def self.up
    create_table :line_contents do |t|
      t.integer :line_place_id
      t.string :title
      t.string :content
      t.text :body
      t.datetime :startdate
      t.datetime :enddate
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table :line_contents
  end
end
