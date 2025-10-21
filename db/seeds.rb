require 'faker'

puts "Cleaning database..."
PostTag.destroy_all
Comment.destroy_all
Post.destroy_all
Tag.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating users..."
users = 10.times.map do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  )
end
puts "Created #{users.count} users"

puts "Creating categories..."
categories = 10.times.map do
  Category.create!(
    name: Faker::Book.unique.genre,
    description: Faker::Lorem.paragraph(sentence_count: 3)
  )
end
puts "Created #{categories.count} categories"

puts "Creating tags..."
tags = 14.times.map do
  Tag.create!(
    name: Faker::Verb.unique.base
  )
end
puts "Created #{tags.count} tags"

puts "Creating posts..."
posts = 50.times.map do
  Post.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    body: Faker::Lorem.paragraphs(number: 3).join("\n\n"),
    user: users.sample,
    category: categories.sample
  )
end
puts "Created #{posts.count} posts"

puts "Creating post-tag associations..."
post_tag_count = 0
posts.each do |post|
  selected_tags = tags.sample(rand(1..4))
  selected_tags.each do |tag|
    PostTag.create!(post: post, tag: tag)
    post_tag_count += 1
  end
end
puts "Created #{post_tag_count} post-tag associations"

puts "Creating comments..."
comments = 100.times.map do
  Comment.create!(
    body: Faker::Lorem.paragraph(sentence_count: 2),
    user: users.sample,
    post: posts.sample
  )
end
puts "Created #{comments.count} comments"

puts "\n=== Seed Summary ==="
puts "Users: #{User.count}"
puts "Categories: #{Category.count}"
puts "Tags: #{Tag.count}"
puts "Posts: #{Post.count}"
puts "Comments: #{Comment.count}"
puts "Post-Tag associations: #{PostTag.count}"
puts "===================="
