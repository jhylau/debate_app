class Comment < ActiveRecord::Base
  attr_accessible :content, :debate_side_id, :user_id
 
  belongs_to :user
  belongs_to :debate_side
  
  validates_presence_of :content, :debate_side_id, :user_id
end
