class DeleteGraphics < ActiveRecord::Migration
  def self.up
    drop_table :graphics
    change_table :articles do |t|
      t.remove :graphic_id
      t.string :graphic
      t.string :graphic_info
      t.string :graphic_source
    end
     change_table :article_topics do |t|
      t.remove :graphic_id
      t.string :graphic
      t.string :graphic_info
      t.string :graphic_source
    end
    change_table :news do |t|
      t.remove :graphic_id
      t.string :graphic
      t.string :graphic_info
      t.string :graphic_source
    end
  end
end