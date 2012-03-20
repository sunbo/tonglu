class CreateCommentReplies < ActiveRecord::Migration
  def self.up
    create_table :comment_replies do |t|
      t.integer  "user_id"
      t.integer  "comment_id"
      t.text     "content"
      t.timestamps
    end
  end

  def self.down
    drop_table :comment_replies
  end
end
