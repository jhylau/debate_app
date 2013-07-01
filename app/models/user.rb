class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :debates_participated_in, :email, :password, :ranking, :tournaments_won, :username, :role
  
  has_many :votes
  has_many :comments
  has_many :debate_sides
  has_many :debates, through: :debate_sides

  validates_presence_of :password, :email, :username
  validates_inclusion_of :role, in: ["user", "admin"]

  def is_admin?
    role == "admin"
  end

  def number_of_debates
    @number_of_debates ||= debates.count
  end

  def number_of_wins
    @number_of_wins ||= debates.where(winner_id: self.id).count
  end

  def global_ranking
    @global_ranking ||= ranking.to_s == nil ? ranking.to_s : 'n/a'
  end
end
