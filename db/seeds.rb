# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'random_data'

# Create posts
50.times do
	Post.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph
	)
end
posts = Post.all

# Create comments
100.times do
	Comment.create!(
		post: posts.sample,
		body: RandomData.random_paragraph
	)
end

puts "Seed Finished."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."

# Create ads
50.times do
	Advertisement.create!(
		title: RandomData.random_sentence,
		copy: RandomData.random_paragraph,
		price: RandomData.random_number
	)
end

puts "Advertisemnts seeds finished!"
puts "#{Advertisement.count} advertisements created."