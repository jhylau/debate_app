class DebateSide < ActiveRecord::Base
  attr_accessible :argument, :conclusion, :rebuttal, :side, :vote_count
  has_many :responses
  has_many :votes
  belongs_to :user
  belongs_to :debate


  validates_presence_of :debate_id, :side
  validates_uniqueness_of :user_id, :scope => :debate_id, :allow_nil => true

  def has_user?
    if self.user == nil
      return false
    else
      return true
    end
  end 

end
