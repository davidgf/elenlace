# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
wedding = Wedding.new
wedding.save
groom = Groom.new({username: "Diego", password: "mesi"})
groom.wedding = wedding
groom.save
bride = Bride.new({username: "Sandra", password: "sandra"})
bride.wedding = wedding
bride.save