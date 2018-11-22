puts 'Dropping db...'

Celestial.destroy_all
User.destroy_all

puts 'Creating ninjas...'
andrew = User.create!(
  email: 'a.erlanger@gmail.com',
  first_name: 'Andrew',
  last_name: 'Erlanger',
  password: '123456',
  password_confirmation: '123456'
)
marcel = User.create!(
  email: 'marcelsf23br@gmail.com',
  first_name: 'Marcel',
  last_name: 'Fonseca',
  password: '123456',
  password_confirmation: '123456'
)
maylee = User.create!(
  email: 'mayleesia@gmail.com',
  first_name: 'May-Lee',
  last_name: 'Sia',
  password: '123456',
  password_confirmation: '123456'
)
aigerim = User.create!(
  email: 'sensotape@gmail.com',
  first_name: 'Aigerim',
  last_name: 'Kalysheva',
  password: '123456',
  password_confirmation: '123456'
)

puts 'Creating celestials...'

body = Celestial.new(
  name: 'Pillars of Creation',
  price: 950.00,
  category: 'nebula',
  location: '7.000 Light years away from Earth',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542882796/Pillars_of_Creation.jpg')
)

body.user = aigerim
body.save!

body = Celestial.new(
  name: 'Andromeda Galaxy',
  price: 1000.00,
  category: 'nebula',
  location: '2.5 million light years away from Earth',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887207/Andromeda_Galaxy__with_h-alpha.jpg')
)

body.user = marcel
body.save!

body = Celestial.new(
  name: 'Halley',
  price: 20.99,
  category: 'asteroid',
  location: 'space 11eknf95',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887672/kosmos_kataklizm_planeta_art_vzryv_asteroidy_komety_oblomki_98315_1280x1024.jpg')
)

body.user = maylee
body.save!

body = Celestial.new(
  name: 'S5 0014+81',
  price: 0.99,
  category: 'black hole',
  location: 'Cepheus Constelation',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887444/black-hole.jpg')
)
body.user = andrew
body.save!

body = Celestial.new(
  name: 'Europa',
  price: 900.00,
  category: 'moon',
  location: 'Just around Jupiter',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887672/europa.jpg')
)
body.user = aigerim
body.save!

body = Celestial.new(
  name: 'K2-155d',
  price: 25.99,
  category: 'planet',
  location: 'Taurus Constelation',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887671/Exoplanet-FI.jpg')
)
body.user = andrew
body.save!

body = Celestial.new(
  name: '243 Ida',
  price: 0.99,
  category: 'asteroid',
  location: 'Asteroid Belt',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887671/Comet_on_26_February_2015_b_NavCam-crop.jpg')
)
body.user = maylee
body.save!

body = Celestial.new(
  name: 'Antares',
  price: 2300.00,
  category: 'star',
  location: 'Scorpio Constelation',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887445/Antares-star.png')
)
body.user = marcel
body.save!
