# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
{
  name: "Wayne",
  email: "wayne@takeda.com",
  password: "1234"
}
]

User.create users

messages = [
{
  user_id:1,
  subject:"Hello",
  body:"World",
  length:5
}
]

Message.create messages
