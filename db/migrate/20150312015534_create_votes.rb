class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote
      t.integer :brief_id
      t.integer :user_id
      t.timestamps
    end
  end
end
