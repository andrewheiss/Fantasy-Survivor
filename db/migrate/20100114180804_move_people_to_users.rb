class MovePeopleToUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
    rename_table :people, :users
    rename_column :sessions, :person_id, :user_id 
  end

  def self.down
    rename_table :users, :people
    rename_column :sessions, :user_id, :person_id
    
    create_table "users", :force => true do |t|
      t.string   "login"
      t.string   "password"
      t.string   "name"
      t.string   "email"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
