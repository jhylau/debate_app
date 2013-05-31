class CreateDebateSides < ActiveRecord::Migration
  def change
    create_table :debate_sides do |t|
      t.text :argument
      t.text :rebuttal
      t.text :conclusion
      t.integer :vote_count
      t.string :user_id
      t.string :side
      t.integer :debate_id

      t.timestamps
    end
  end
end
