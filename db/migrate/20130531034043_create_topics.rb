class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :subtitle
      t.integer :category_id

      t.timestamps
    end
  end
end
