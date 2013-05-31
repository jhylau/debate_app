class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.integer :topic_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
