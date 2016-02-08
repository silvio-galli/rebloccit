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

# Create unique Post
unique_post_title = RandomData.random_sentence
unique_post_body = RandomData.random_paragraph
=begin deprecated version
Post.find_or_create_by!(
	title: RandomData.random_sentence,
	body: RandomData.random_paragraph
)
=end
Post.where(title: unique_post_title, body: unique_post_body).first_or_create

# Create unique comment
posts = Post.all
unique_comment_body = RandomData.random_paragraph
=begin deprecated version
Comment.find_or_create_by!(
	post: posts.sample,
	body: unique_comment_body
)
=end
Comment.where(post: posts.sample, body: unique_comment_body).first_or_create

last_post = Post.last
last_comment = Comment.last
puts "After adding unique post we have #{Post.count} posts. The title of last unique post is: #{last_post.title}"
puts "After adding unique comment we have #{Comment.count} comments."
puts "Last comment is associated to post number #{last_comment.post.id}."