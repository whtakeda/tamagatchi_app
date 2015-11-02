# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Message.destroy_all
Tamagatchi.destroy_all
User.destroy_all

users = [
{
  name: "Wayne",
  email: "wayne@takeda.com",
  password: "1234"
}
]

#User.create users
