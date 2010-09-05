class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.belongs_to :topic

      t.timestamps
    end
    add_index :votes, :topic_id
  end

  def self.down
    drop_table :votes
  end
end
