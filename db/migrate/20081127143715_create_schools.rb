class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.integer :user_id
      t.string :name
      t.string :year
      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
