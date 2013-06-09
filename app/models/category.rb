class Category < ActiveRecord::Base
  attr_accessible :subtitle, :title
  has_many :topics
  
  validates_presence_of :title
end
