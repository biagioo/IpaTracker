# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
i = Ipa.create(name:"blonde ambition", brand: "great south bay brewery", size: 16)
u = User.create(email: "test", password: "password", username:"testest", bio: "another test")
r = Review.new(title: "test review", content: "test reviews")
r.user = u 
r.ipa = i 
r.save