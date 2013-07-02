# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create(:title => 'Politics')
Topic.create(:title => 'Immigration',:subtitle => 'Immigration reform is needed', :category_id => 1, :image => File.open(File.join(Rails.root, '/app/assets/images/dream_rally_1.jpg')))
Topic.create(:title => 'Obama',:subtitle => 'Obama is a good president', :category_id => 1, :image => File.open(File.join(Rails.root, '/app/assets/images/obama.jpg')))
Topic.create(:title => 'Same-sex Marriage',:subtitle => 'Gay marriage should be legal', :category_id => 1, :image => File.open(File.join(Rails.root, '/app/assets/images/gay-marriage.jpg')))

admin = User.create! :username => 'Admin', :email => 'admin@gmail.com', :password => 'topsecret', role: 'admin'
user1 = User.create! :username => 'Obama', :email => 'obama@gmail.com', :password => 'topsecret'
user2 = User.create! :username => 'Romney', :email => 'romney@gmail.com', :password => 'topsecret'
user3 = User.create! :username => 'jhylau', :email => 'jhylau1@gmail.com', :password => 'topsecret'

3.times do |i|
  debate = Debate.create(:topic_id => i + 1)
  DebateSide.create(:debate_id => debate.id, side: 'yes', user_id: user1.id)
  DebateSide.create(:debate_id => debate.id, side: 'no', user_id: user2.id)
end

3.times do |i|
  debate = Debate.create(:topic_id => i + 1)
  DebateSide.create(:debate_id => debate.id, side: 'yes', user_id: user3.id)
  DebateSide.create(:debate_id => debate.id, side: 'no')
end

