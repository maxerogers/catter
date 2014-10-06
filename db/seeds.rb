# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name: "Grumpy Cat", email: "grumpy@grumpy.com", password: "grump", password_confirmation: "grump")
User.create(name: "Hamiliton", email: "ham@ham.com", password: "ham", password_confirmation: "ham")
User.create(name: "Colonel Meow", email: "meow@meow.com", password: "meow", password_confirmation: "meow")
Following.create(user: User.first, follower: User.last)
