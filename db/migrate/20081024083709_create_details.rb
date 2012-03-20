class CreateDetails < ActiveRecord::Migration
  def self.up
    create_table :details do |t|
      t.integer :user_id
      t.text  :about_me
      t.datetime :birthday
      t.string :sex
      t.string :city
      t.string :qq
      t.string :gtalk
      t.string :msn
      t.string :mobile
      t.string :photo
      t.timestamps
    end
  end

  def self.down
    drop_table :details
  end
end
