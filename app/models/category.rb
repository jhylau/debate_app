class Category < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:subtitle, :title]
  
  attr_accessible :subtitle, :title
  
  has_many :topics
  
  validates_presence_of :title
end
