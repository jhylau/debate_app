class DebateSide < ActiveRecord::Base
  attr_accessible :argument, :conclusion, :debate_id, :rebuttal, :side, :user_id, :vote_count
  has_many :votes
  has_many :users
  belongs_to :debate
end
