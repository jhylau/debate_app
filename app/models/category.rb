class Category < ActiveRecord::Base
  attr_accessible :subtitle, :title

  validates_presence_of :title
end
