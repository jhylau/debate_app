class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.integer :ranking
      t.integer :debates_participated_in
      t.integer :tournaments_won

      t.timestamps
    end
  end
end
