# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create(:title => 'Politics')
Topic.create(:title => 'Immigration Reform',:subtitle => 'Immigration reform is needed',:category_id => 1)
user1 = User.create! :username => 'Obama', :email => 'obama@gmail.com', :password => 'topsecret'
user2 = User.create! :username => 'Romney', :email => 'romney@gmail.com', :password => 'topsecret'
3.times do
  debate = Debate.create(:topic_id => 1)
  DebateSide.create(:debate_id => debate.id, side: 'yes', user_id: user1.id)
  DebateSide.create(:debate_id => debate.id, side: 'no', user_id: user2.id)
end
3.times do
  debate = Debate.create(:topic_id => 1)
  DebateSide.create(:debate_id => debate.id, side: 'yes', user_id: user1.id)
  DebateSide.create(:debate_id => debate.id, side: 'no')
end

