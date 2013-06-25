class Topic < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:subtitle, :title]
  
  attr_accessible :category_id, :subtitle, :title, :image
  
  has_many :debates
  belongs_to :category
  
  mount_uploader :image, ImageUploader

  validates_presence_of :category_id, :subtitle, :title
  validates_format_of :title, :with => /^[^ ]+$/
  validates :subtitle, :length => { :maximum => 80 }
  validates :title, :length => {:maximum => 20}
end
