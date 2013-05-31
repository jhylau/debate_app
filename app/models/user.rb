class User < ActiveRecord::Base
  attr_accessible :debates_participated_in, :email, :password, :ranking, :tournaments_won, :username
  has_many :votes
  has_many :comments
  has_many :debatesides
end
