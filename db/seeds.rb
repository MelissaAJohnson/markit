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

User.create!(
  email: 'user@markit.com',
  password: 'helloworld',
  confirmed_at: '2016-08-21'
)
users = User.all

# Create Topics
Topic.create!(
  title: 'funny',
  user: users.sample
)

Topic.create!(
  title: 'puppies',
  user: users.sample
)

Topic.create!(
  title: 'weddings',
  user: users.sample
)
topics = Topic.all

Bookmark.create!(
  user: users.sample,
  topic_id: 1,
  url: 'http://dilbert.com/',
  created_at: rand(10.minutes .. 1.year)
)

Bookmark.create!(
  user: users.sample,
  topic_id: 1,
  url: 'https://garfield.com/comic',
  created_at: rand(10.minutes .. 1.year)
)

Bookmark.create!(
  user: users.sample,
  topic_id: 2,
  url: 'http://dogtime.com/puppies/255-puppies',
  created_at: rand(10.minutes .. 1.year)
)

Bookmark.create!(
  user: users.sample,
  topic_id: 2,
  url: 'http://www.forbes.com/sites/kristintablang/2016/02/03/uber-puppies-super-bowl-puppy-bowl-xii/',
  created_at: rand(10.minutes .. 1.year)
)

Bookmark.create!(
  user: users.sample,
  topic_id: 2,
  url: 'http://www.sheknows.com/pets-and-animals/articles/992643/25-puppies-to-make-your-heart-melt',
  created_at: rand(10.minutes .. 1.year)
)

Bookmark.create!(
  user: users.sample,
  topic_id: 3,
  url: 'http://ginazeidler.com/2016/08/11/lightandfreshjjhillwedding/',
  created_at: rand(10.minutes .. 1.year)
)
Bookmark.create!(
  user: users.sample,
  topic_id: 3,
  url: 'https://www.theknot.com/',
  created_at: rand(10.minutes .. 1.year)
)
bookmarks = Bookmark.all

puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
