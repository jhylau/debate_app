class DebateSide < ActiveRecord::Base
  attr_accessible :argument, :conclusion, :debate_id, :rebuttal, :side, :user_id, :vote_count
  
  has_many :votes
  belongs_to :user
  belongs_to :debate

  validates_presence_of :debate_id, :side
  validates_uniqueness_of :user_id, :scope => :debate_id

  private 
  def has_user?
    if self.user == nil
      return false
    else
      return true
    end
  end 
  
end
