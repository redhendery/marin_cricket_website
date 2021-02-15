# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{
  first_name: 'Steve',
  last_name: 'Stevenson',
  email: 'steve@email.com',
  password: 'iamsteve',
  password_confirmation: 'iamsteve',
  admin: true,
  role: 'Bowler',
  bats: 'Right',
  bowls: 'Left',
  profile: 'I am Steve from Venezuela.',
  activated: true,
  activated_at: Time.zone.now
}, {
  first_name: 'Mike',
  last_name: 'Michealson',
  email: 'mike@email.com',
  password: 'iammike',
  password_confirmation: 'iammike',
  admin: false,
  role: 'Batsmen',
  bats: 'Right',
  bowls: 'Left',
  profile: 'I am Mike and I am a lion tamer.',
  activated: true,
  activated_at: Time.zone.now
}])

p "added #{User.count} users"

newsletters = Newsletter.create([{
  first_name: 'David',
  last_name: 'Davidson',
  email: 'david@email.com',
}, {
  first_name: 'Susan',
  last_name: 'Susanson',
  email: 'susan@email.com',
}])

p "added #{Newsletter.count} newsletters"
