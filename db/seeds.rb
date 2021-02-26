# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"


puts "initiaizing seeding sequence"
10.times do
    pet = Pet.new({
        animal_type: Faker::Creature::Animal.name,
        name: Faker::Creature::Dog.name,
        age: rand(1..20),
        description: Faker::Creature::Dog.meme_phrase
    })

    pet.user = User.find(1)
    pet.save
    puts "Pet created with the name \"#{pet.name}\" belonging to user \"#{User.find(1).id}\""
end
puts "ending seeding sequence"
