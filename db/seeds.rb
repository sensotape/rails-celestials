puts 'Dropping db...'

User.destroy_all
Celestial.destroy_all

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
  name: 'Halley',
  price: 20.99,
  category: 'asteroid',
  location: 'space 11eknf95'
)
body.user = andrew
body.save!
