class Debate < ActiveRecord::Base
  attr_accessible :topic_id, :winner_id
  has_many :debate_sides
  belongs_to :topic
  belongs_to :winner, class_name: 'User'

  validates_presence_of :topic_id

  has_many :users, :through => :debate_sides

  def only_one_user
    Debate.where
  end
end
