class AddSource < ActiveRecord::Migration
  def self.up
add_column :articles, :graphic_description,:string
add_column :articles, :source,:text
add_column :article_topics, :graphic_description,:string
add_column :article_topics, :source, :text
add_column :news, :graphic_description,:string
add_column :news, :source,:text
    change_table :articles do |t|
      t.remove :graphic_info
      t.remove :graphic_source
    end
     change_table :article_topics do |t|
      t.remove :graphic_info
      t.remove :graphic_source
    end
    change_table :news do |t|
      t.remove :graphic_info
      t.remove :graphic_source
    end
  end
end
