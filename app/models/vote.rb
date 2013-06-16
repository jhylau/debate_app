class Vote < ActiveRecord::Base
  attr_accessible :debate_side_id, :user_id
  
  belongs_to :user
  belongs_to :debate_side

  validates_presence_of :debate_side_id, :user_id
  # validates :debate_side_id, :uniqueness => {:scope=>:user_id,  :message => "can only have one vote per user" }
end
