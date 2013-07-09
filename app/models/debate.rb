class Debate < ActiveRecord::Base
  include PgSearch
  pg_search_scope :debate_search, :associated_against => {
    :topic => [:title, :subtitle],
    :category => [:title, :subtitle],
    :responses => [:content]
  }

  attr_accessible :topic_id
  has_many :debate_sides
  has_many :responses, through: :debate_sides
  has_many :users, through: :debate_sides
  has_one :category, through: :topic
  belongs_to :topic
  belongs_to :winner, class_name: 'User'

  validates_presence_of :topic_id

  has_many :users, :through => :debate_sides
  has_many :votes, :through => :debate_sides

  paginates_per 6

  def has_one_user?
    user_number = users.count
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
