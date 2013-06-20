class Vote < ActiveRecord::Base
  attr_accessible :debate_side_id, :user_id
  
  belongs_to :user
  belongs_to :debate_side

  validates_presence_of :debate_side_id, :user_id
  validates :debate_side_id, :uniqueness => {:scope=>:user_id,  :message => "can only have one vote per user" }
  validate :uniqueness_of_debate

  def uniqueness_of_debate
    if debate_side
      debate =  debate_side.debate
      if debate.votes.where(user_id: user.id).present?
      errors.add(:uniqueness_error, "You have already voted on a debate.")
      end
    end
  end
end
