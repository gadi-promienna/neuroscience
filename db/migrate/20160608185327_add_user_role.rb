class AddUserRole < ActiveRecord::Migration
  def self.up
     add_column :users, :name, :string
     add_column :users, :role, :string
  end
   
end
