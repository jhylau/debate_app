class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :response_type
      t.text :content
      t.integer :debate_side_id

      t.timestamps
    end
  end
end
