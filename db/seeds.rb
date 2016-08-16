# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Create user
User.create!(
  email: 'member@markit.com',
  password: 'helloworld',
  confirmed_at: '2016-08-14'
)
users = User.all

# Create Topics
5.times do
  Topic.create!(
    title: Faker::Lorem.word,
    user: users.sample
  )
end
topics = Topic.all

# Create Bookmarks
15.times do
  bookmark = Bookmark.create!(
    topic: topics.sample,
    url: Faker::Internet.url
  )
  bookmark.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
end
bookmarks = Bookmark.all

puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
