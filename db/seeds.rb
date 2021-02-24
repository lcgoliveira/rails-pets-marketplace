# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
require "nokogiri"

user = User.new(Faker::Name.first_name, Faker::Name.last_name, Faker::Internet.email, doc_cpf:"xxx.xxx.xxx-xx", address: Faker::Address.full_address)
user.save

12.times do
  pet = Pet.new(user_id: user.id, name: Faker::Name.first_name, animal_type: Faker::Creature::Dog, age: 1..18, description: Faker::Creature::Dog.breed)
pet.save
  