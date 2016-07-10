class CreateBibliographyElements < ActiveRecord::Migration
  def change
    create_table :bibliography_elements do |t|
      t.string :friendly_name
      t.string :source
      t.text :description

      t.timestamps null: false
    end
  end
end
