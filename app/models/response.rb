class Response < ActiveRecord::Base
  attr_accessible :debate_side_id, :content, :response_type

  belongs_to :debate_side
  validates_presence_of :debate_side_id, :content, :response_type
end
