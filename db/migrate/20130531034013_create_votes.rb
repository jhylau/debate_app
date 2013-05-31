class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :debate_side_id
      t.integer :user_id

      t.timestamps
    end
  end
end
