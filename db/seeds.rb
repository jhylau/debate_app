# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create(:title => 'Politics')
Topic.create(:title => 'Immigration',:subtitle => 'Immigration reform is needed', :category_id => 1, :image => File.open(File.join(Rails.root, '/app/assets/images/dream_rally_1.jpg')))
Topic.create(:title => 'Obama',:subtitle => 'Obama is a good president', :category_id => 1, :image => File.open(File.join(Rails.root, '/app/assets/images/obama-debate.jpg')))
Topic.create(:title => 'Same-sex Marriage',:subtitle => 'Gay marriage should be legal', :category_id => 1, :image => File.open(File.join(Rails.root, '/app/assets/images/gay-marriage.jpg')))

admin = User.create! :username => 'Admin', :email => 'admin@gmail.com', :password => 'topsecret', role: 'admin'
user1 = User.create! :username => 'Obama', :email => 'obama@gmail.com', :password => 'topsecret'
user2 = User.create! :username => 'Romney', :email => 'romney@gmail.com', :password => 'topsecret'
user3 = User.create! :username => 'jhylau', :email => 'jhylau1@gmail.com', :password => 'topsecret'

2.times do |i|
  debate = Debate.create(:topic_id => i + 1)
  ds_1 = DebateSide.new
  ds_1.debate_id = debate.id
  ds_1.side = 'yes'
  ds_1.user_id = user1.id
  ds_1.save
  ds_2 = DebateSide.new
  ds_2.debate_id = debate.id
  ds_2.side = 'no'
  ds_2.user_id = user2.id
  ds_2.save
end

2.times do |i|
  debate2 = Debate.create(:topic_id => i + 1)
  ds_3 = DebateSide.new
  ds_3.debate_id = debate2.id
  ds_3.side = 'yes'
  ds_3.user_id = user3.id
  ds_3.save
  ds_4 = DebateSide.new
  ds_4.debate_id = debate2.id
  ds_4.side = 'no'
  ds_4.save
end

