class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.references :article_topic, index: true, foreign_key: true
      t.text :content
      t.references :author, index: true, foreign_key: true
      t.references :graphic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
