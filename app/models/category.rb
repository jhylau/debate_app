class Category < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_full_name, :against => [:first_name, :last_name]

  attr_accessible :subtitle, :title
  
  has_many :topics
  
  validates_presence_of :title
end
