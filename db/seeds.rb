# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
comedies = Category.create(name: "Comedies")
dramas = Category.create(name: "Dramas")

Video.create(title: "Futurama", description: "Funny space show", 
  small_cover_url: "/tmp/futurama.jpg", large_cover_url: "/tmp/futurama.jpg", category: comedies)
Video.create(title: "Monk", description: "Show starting wings dude.", 
  small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: dramas)
Video.create(title: "Archer", description: "Funnier cartoon.",
  small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: comedies)
Video.create(title: "Futurama", description: "Funny space show", 
  small_cover_url: "/tmp/futurama.jpg", large_cover_url: "/tmp/futurama.jpg", category: comedies)
Video.create(title: "Monk", description: "Show starting wings dude.", 
  small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: dramas)
Video.create(title: "Archer", description: "Funnier cartoon.",
  small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: comedies)
Video.create(title: "Futurama", description: "Funny space show", 
  small_cover_url: "/tmp/futurama.jpg", large_cover_url: "/tmp/futurama.jpg", category: comedies)
Video.create(title: "Monk", description: "Show starting wings dude.", 
  small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: dramas)
Video.create(title: "Archer", description: "Funnier cartoon.",
  small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: comedies)
Video.create(title: "Futurama", description: "Funny space show", 
  small_cover_url: "/tmp/futurama.jpg", large_cover_url: "/tmp/futurama.jpg", category: comedies)
Video.create(title: "Monk", description: "Show starting wings dude.", 
  small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: dramas)
Video.create(title: "Archer", description: "Funnier cartoon.",
  small_cover_url: "/tmp/monk.jpg", large_cover_url: "/tmp/monk_large.jpg", category: comedies)