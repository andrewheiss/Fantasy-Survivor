class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.string :contestant_id
      t.string :episode_id

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
