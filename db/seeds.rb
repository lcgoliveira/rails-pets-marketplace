# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
pets_urls = ['https://res.cloudinary.com/dhqwiymvf/image/upload/v1614281658/pexels-anna-shvets-4587998_zjut25.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614197402/l10fydpjo813ib9gjudcsc6yyq8j.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614197004/4sq504ciwzzpsq4qp9asdy919jpx.png',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614196721/fzhzxy3f9x5d036irt73usjiquo9.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614196567/yniduqjd7ghd14luyxqm7b7dew2r.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614194829/nnh8od6mcogck86y3lohs576y3tx.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614194492/neawywfey1qpjo57jt3uix8u80wj.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614193264/yhtqmb127w0zumbh6rou4em1p8i8.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614190996/94j21knxlaoeoap5eax7sp8lfnol.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614188261/lx3i5v6hbr848givlvewfc6bthdc.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614185775/5xn8kxfx5cwyanj51g764pkk3qjo.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614185091/jqzjdls5ju2xba38xyu3y6dv4ta0.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614184762/cqp5ybgrlkyw352tnsfb410hm7jf.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614184295/hw3oiotwn4ewscuhwmcsjn2c71wt.jpg',
'https://res.cloudinary.com/dhqwiymvf/image/upload/v1614278220/pexels-anna-shvets-4587993_lzakpc.jpg'
]

User.create!(email: Faker::Internet.email, first_name: "Leonardo", last_name: "Oliveira", date_of_birth: nil, doc_cpf: "", description: nil, long: nil, lat: nil, address: "Sao Paulo", password:"123456")

puts "initiaizing seeding sequence"
pets_urls.each_with_index do |id, index|
    pet = Pet.new({
        animal_type: Faker::Creature::Animal.name,
        name: Faker::Creature::Dog.name,
        age: rand(1..20),
        description: Faker::Creature::Dog.meme_phrase
    })

    pet.user = User.find(1)
    pet.save
    image = URI.open(pets_urls[index])
    pet.photo.attach(io: image, filename: pet.id, content_type: 'image/png')
    puts "Pet created with the name \"#{pet.id}\" belonging to user \"#{User.find(1).id}\""
end
puts "ending seeding sequence"


