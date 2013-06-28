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

end
