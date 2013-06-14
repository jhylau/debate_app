class AddImageToDebate < ActiveRecord::Migration
  def change
    add_column :debates, :image, :string
  end
end
