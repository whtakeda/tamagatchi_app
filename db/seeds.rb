# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Message.destroy_all
#Tamagatchi.destroy_all
#User.destroy_all
TamagatchiRank.destroy_all
Message.destroy_all

users = [
{
  name: "Wayne",
  email: "wayne@takeda.com",
  password: "1234"
}
]

#User.create users

tamagatchi_ranks = [
  {
    rank:1,
    level: 1,
    image:"tamagatchi.png"
  },
  {
    rank:2,
    level: 40,
    image:"tamagatchi-cat01.png"
  },
  {
    rank:3,
    level: 60,
    image:"tamagatchi-cat02.png"
  },
  {
    rank:4,
    level:80,
    image:"tamagatchi-cat03.png"
  },
  {
    rank:5,
    level:100,
    image:"tamagatchi-cat04.png"
  }
]

TamagatchiRank.create tamagatchi_ranks
