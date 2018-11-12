# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Movie.destroy_all
Vote.destroy_all

eddie = User.create(name: "Eddie")
alex = User.create(name: "Alex")

Movie.create(title: "Clue", url: "https://www.imdb.com/title/tt0088930/?ref_=fn_al_tt_1")
Movie.create(title: "Monty Python's Holy Grail")