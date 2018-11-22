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
  price: 950000000.00,
  category: 'nebula',
  location: '7.000 Light years away from Earth',
  photo: ''
)

body = Celestial.new(
  name: 'Andromeda Galaxy',
  price: 1000000000000.00,
  category: 'nebula',
  location: '2.5 million light years away from Earth',
  photo: ''
)

body = Celestial.new(
  name: 'Halley',
  price: 20.99,
  category: 'asteroid',
  location: 'space 11eknf95',
  photo: ''
)

body = Celestial.new(
  name: 'S5 0014+81',
  price: 0.99,
  category: 'black hole',
  location: 'Cepheus Constelation',
  photo: ''
)
body.user = andrew
body.save!
