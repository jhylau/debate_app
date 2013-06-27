class Debate < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:winner]

  attr_accessible :topic_id
  has_many :debate_sides
  belongs_to :topic
  belongs_to :winner, class_name: 'User'

  validates_presence_of :topic_id

  has_many :users, :through => :debate_sides
  has_many :votes, :through => :debate_sides

  paginates_per 6

  def has_one_user?
    user_number = 0
    if self.debate_sides.first.user != nil
      user_number = user_number + 1
    end
    if self.debate_sides.last.user != nil
      user_number = user_number + 1
    end
    user_number == 1 ? true : false
  end

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end
  end

end
