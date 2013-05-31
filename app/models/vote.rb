class Vote < ActiveRecord::Base
  attr_accessible :debate_side_id, :user_id
  belongs_to :user_id
  belongs_to :debateside
end
