class Topic < ActiveRecord::Base
  attr_accessible :category_id, :subtitle, :title
  has_many :debates
  belongs_to :category
end
