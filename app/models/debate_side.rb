class DebateSide < ActiveRecord::Base
  attr_accessible :argument, :conclusion, :debate_id, :rebuttal, :side, :user_id, :vote_count
  
  has_many :votes
  belongs_to :user
  belongs_to :debate

  validates_presence_of :debate_id, :side
  validates_uniqueness_of :user_id, :scope => :debate_id, :allow_nil => true

  private 
  def has_user?
    if self.user == nil
      return false
    else
      return true
    end
  end 

  def users_cant_join_both_sides_of_debate
    return if user.nil?
    if user_id == post.user_id
      errors[:base] = "A user can't vote their posts"
    end
  end
  
end
