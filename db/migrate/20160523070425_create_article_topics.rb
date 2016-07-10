class CreateArticleTopics < ActiveRecord::Migration
  def change
    create_table :article_topics do |t|
      t.string :title
      t.references :graphic, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
