# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(email: 'sai.kvana@gmail.com')
p "Auth token: #{user1.auth_token}"

user2 = User.create!(email: 'chsai.btech@gmail.com')
p "Auth token: #{user2.auth_token}"




