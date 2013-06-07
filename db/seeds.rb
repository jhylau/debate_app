# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

6.times do
Topic.create(:title => 'Immigration Reform',:subtitle => 'Immigration reform is needed',:category_id => 1)

Category.create(:title => 'Politics')

Debate.create(:topic_id => 1)
end
