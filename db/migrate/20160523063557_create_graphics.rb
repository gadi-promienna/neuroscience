class CreateGraphics < ActiveRecord::Migration
  def change
    create_table :graphics do |t|
      t.string :name
      t.string :source
      t.text :description

      t.timestamps null: false
    end
  end
end
