class AddUserPermissionLevels < ActiveRecord::Migration
  def self.up
    add_column :users, :level, :string, :default => 'user'
  end

  def self.down
    remove_column :users, :level
  end
end
