class DebateSide < ActiveRecord::Base

  attr_accessible  :side, :debate_id, :user_id
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

  def new_response
    if responses.count == 0
      responses.new(response_type: 'Argument')
    elsif responses.count == 1
      responses.new(response_type: 'Rebuttal')
    elsif responses.count == 2
      responses.new(response_type: 'Conclusion')      
    end
  end 

end
