class CreateLineArticles < ActiveRecord::Migration
  def self.up
    create_table :line_articles do |t|
      t.integer :line_place_id
      t.string :title
      t.string :body
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table :line_articles
  end
end
