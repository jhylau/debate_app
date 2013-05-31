class Comment < ActiveRecord::Base
  attr_accessible :content, :debate_side_id, :user_id
  belongs_to :user
  belongs_to :debate_side
end
