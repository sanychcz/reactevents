# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

places = ["Prague", "Ostrava", "Brno", "Berlin", "Paris", "Amsterdam", "Barcelona"]

titles = ["Ruby", "PHP", "JS", "Python", "Java", "Android", "IOS"]

(1..6).each do |e|
	Event.create(title: "#{titles[e]}", place: "#{places[e]}", description: "Some description", date: DateTime.now + e )
end