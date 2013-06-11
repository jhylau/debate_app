# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.create(:title => 'Politics')
Topic.create(:title => 'Immigration Reform',:subtitle => 'Immigration reform is needed',:category_id => 1)
6.times do
  Debate.create(:topic_id => 1)

  DebateSide.create(:debate_id => 1, side: 'yes')

  DebateSide.create(:debate_id => 1, side: 'no')
end
