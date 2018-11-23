puts 'Dropping db...'

Message.destroy_all
Interest.destroy_all
Celestial.destroy_all
User.destroy_all

puts 'Creating ninjas...'
andrew = User.create!(
  email: 'a.erlanger@gmail.com',
  avatar: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542906721/user.jpg') ,
  first_name: 'Andrew',
  last_name: 'Erlanger',
  password: '123456',
  password_confirmation: '123456'
)
marcel = User.create!(
  email: 'marcelsf23br@gmail.com',
  avatar: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542906721/2018-11-22_18.10.49.jpg') ,
  first_name: 'Marcel',
  last_name: 'Fonseca',
  password: '123456',
  password_confirmation: '123456'
)
maylee = User.create!(
  email: 'mayleesia@gmail.com',
  avatar: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542906721/george-washington.jpg') ,
  first_name: 'May-Lee',
  last_name: 'Sia',
  password: '123456',
  password_confirmation: '123456'
)
aigerim = User.create!(
  email: 'sensotape@gmail.com',
  avatar: open( 'https://res.cloudinary.com/dlatcqlhm/image/upload/v1542906723/IMG_2340.jpg'),
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
  description: 'You have all seen the Hubble pictures, now you can buy them for yourself!',
  location: '7.000 Light years away from Earth',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542882796/Pillars_of_Creation.jpg')
)

body.user = aigerim
body.save!

body = Celestial.new(
  name: 'Andromeda Galaxy',
  price: 1000.00,
  category: 'nebula',
  description:'The closest galaxy to the milky way is just around the corner!',
  location: '2.5 million light years away from Earth',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887207/Andromeda_Galaxy__with_h-alpha.jpg')
)

body.user = marcel
body.save!

body = Celestial.new(
  name: 'Halley',
  price: 20.99,
  category: 'asteroid',
  description:'The famous comet! Buy it before it destroys Earth!',
  location: 'space 11eknf95',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887672/kosmos_kataklizm_planeta_art_vzryv_asteroidy_komety_oblomki_98315_1280x1024.jpg')
)

body.user = maylee
body.save!

body = Celestial.new(
  name: 'S5 0014+81',
  price: 38,
  category: 'black hole',
  description:'A super-massive Black Hole. Cue Muse song.',
  location: 'Cepheus Constelation',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887444/black-hole.jpg')
)
body.user = andrew
body.save!

body = Celestial.new(
  name: 'Europa',
  price: 900.00,
  category: 'moon',
  description:'A beautiful moon of Jupiter, might contain a subterranean ocean filled with different and alien forms of life.',
  location: 'Just around Jupiter',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887672/europa.jpg')
)
body.user = aigerim
body.save!

body = Celestial.new(
  name: 'K2-155d',
  price: 25.99,
  category: 'planet',
  description:'A "Super Earth", containing limitless resourcers for a new colony. It may have its own lifeforms!',
  location: 'Taurus Constelation',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887671/Exoplanet-FI.jpg')
)
body.user = andrew
body.save!

body = Celestial.new(
  name: '243 Ida',
  price: 5,
  category: 'asteroid',
  description:'One of the biggest asteroids in our solar system, too bad it is only made of rock and worth nothing.',
  location: 'Asteroid Belt',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887671/Comet_on_26_February_2015_b_NavCam-crop.jpg')
)
body.user = maylee
body.save!

body = Celestial.new(
  name: 'Antares',
  price: 2300.00,
  category: 'star',
  description:'The red supergiant star at the heart of the Scorpio Constelation. Please buy this to help me pay off my debts :D',
  location: 'Scorpio Constelation',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542887445/Antares-star.png')
)
body.user = marcel
body.save!

body = Celestial.new(
  name: 'Citadel of Ricks',
  price: 4000.00,
  category: 'asteroid',
  description:'A citadel made up of thousands of mad geniuses which are all called "Rick" and their not-so-intelligent minions, the "Mortys". Buy at your own risk.',
  location: '?????????',
  photo: open('https://res.cloudinary.com/dlatcqlhm/image/upload/v1542898720/S1e10_Citadel_of_Ricks.png')
)
body.user = marcel
body.save!
