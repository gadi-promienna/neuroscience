class ChangeNews < ActiveRecord::Migration
  def self.up
    change_table :news do |t|
      t.remove :type
      t.string :kind
     end
  end
end
