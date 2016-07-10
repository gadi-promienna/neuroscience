class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.date :date
      t.string :title
      t.string :type
      t.text :content
      t.references :author, index: true, foreign_key: true
      t.references :graphic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
