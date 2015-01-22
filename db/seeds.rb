# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.create(title: "Futurama", description: "Funny space show", 
  small_cover_url: "/public/tmp/futurama.jpg", large_cover_url: "/public/tmp/futurama.jpg")
Video.create(title: "Monk", description: "Show starting wings dude.", 
  small_cover_url: "/public/tmp/monk.jpg", large_cover_url: "/public/tmp/monk_large.jpg")