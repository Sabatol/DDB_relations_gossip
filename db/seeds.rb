# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
PmUser.destroy_all
GoTag.destroy_all


require 'faker'

users = []
cities = []
gossips = []
tags = []
private_messages = []
pm_users = []

20.times do
  city = City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
  cities << city
end

10.times do 
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: rand(7..150), city: cities.sample)
  users << user
end

20.times do
  gossip = Gossip.create(title: Faker::Lorem.word, content: Faker::Lorem.sentence(word_count: 10), user: users.sample)
  gossips << gossip
end

10.times do
  tag = Tag.create(title: Faker::Lorem.word)
  tags << tag
end

40.times do
  GoTag.create(tag: tags.sample, gossip: gossips.sample)
end

100.times do
  private_message = PrivateMessage.create(content: "texte", sender: users.sample)
  private_messages << private_message
end

300.times do
  random = rand(1..10)
  pm_user = PmUser.create(private_message: private_messages.sample, user: users.sample)
  pm_users << pm_user
end