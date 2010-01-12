class CreateEpisodes < ActiveRecord::Migration
  def self.up
    create_table :episodes do |t|
      t.string :name
      t.datetime :date
      t.integer :show_id

      t.timestamps
    end
  end

  def self.down
    drop_table :episodes
  end
end
