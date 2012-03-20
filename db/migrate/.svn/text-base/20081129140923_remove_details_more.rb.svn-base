class RemoveDetailsMore < ActiveRecord::Migration
  def self.up
    remove_column :details, :is_show_about_me
    remove_column :details, :is_show_birthday
    remove_column :details, :is_show_sex
    remove_column :details, :is_show_city
    remove_column :details, :is_show_qq
    remove_column :details, :is_show_gtalk
    remove_column :details, :is_show_msn
    remove_column :details, :is_show_mobile
  end

  def self.down
    add_column :details, :is_show_about_me, :boolean,:default => true
    add_column :details, :is_show_birthday, :boolean,:default => true
    add_column :details, :is_show_sex, :boolean,:default => true
    add_column :details, :is_show_city, :boolean,:default => true
    add_column :details, :is_show_qq, :boolean,:default => true
    add_column :details, :is_show_gtalk, :boolean,:default => true
    add_column :details, :is_show_msn, :boolean,:default => true
    add_column :details, :is_show_mobile, :boolean,:default => true
  end
end
