class RemoveColumnsFromDebateSides < ActiveRecord::Migration
  def up
    remove_column :debate_sides, :argument
    remove_column :debate_sides, :rebuttal
    remove_column :debate_sides, :conclusion
  end

  def down
    add_column :debate_sides, :argument
    add_column :debate_sides, :rebuttal
    add_column :debate_sides, :conclusion
  end
end
