class Topic < ActiveRecord::Base
  attr_accessible :category_id, :subtitle, :title, :image
  has_many :debates
  belongs_to :category
  mount_uploader :image, ImageUploader

  validates_presence_of :category_id, :subtitle, :title
end
