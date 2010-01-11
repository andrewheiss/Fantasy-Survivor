class CreateContestants < ActiveRecord::Migration
  def self.up
    create_table :contestants do |t|
      t.string :name
      t.boolean :playing,     :default => true
      t.integer :votes_count
      t.timestamp :day_off,   :default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :contestants
  end
end
