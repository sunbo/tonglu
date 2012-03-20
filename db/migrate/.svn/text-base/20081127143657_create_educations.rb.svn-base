class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.integer :user_id
      t.string :name
      t.string :professional
      t.string :degree
      t.string :year
      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
