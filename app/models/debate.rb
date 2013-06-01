class Debate < ActiveRecord::Base
  attr_accessible :topic_id, :winner_id
  has_many :debatesides
  belongs_to :topic

  validates_presence_of :topic_id, :winner_id
end
