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
  paid: true,
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
  paid: false,
  activated: true,
  activated_at: Time.zone.now
}])

28.times do |n|
  first_name = Faker::Name.unique.first_name
  last_name = Faker::Name.unique.last_name
  email = Faker::Internet.email(name: first_name)
  password = 'password'
  bats = 'Right'
  bowls = 'Left'
  role = ['Batsmen', 'Bolwer', 'All Rounder', 'Wicket Keeper']
  profile = Faker::ChuckNorris.fact
  admin = false
  paid = Faker::Boolean.boolean(true_ratio: 0.5)
  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password,
    password_confirmation: password,
    bats: bats,
    bowls: bowls,
    role: role.sample,
    profile: profile,
    admin: admin,
    paid: paid,
    activated: true,
    activated_at: Time.zone.now)
end

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

teams = Team.create([{
  name: 'Marin One',
  about: 'Competitive team playing in the NCCA league competition.',
  home_field: 'Piper Park, Larkspur',
  abbreviation: 'mno'
}, {
  name: 'Marin Two',
  about: 'Competitive team playing in the NCCA league competition.',
  home_field: 'Piper Park, Larkspur',
  abbreviation: 'MnT'
}, {
  name: 'Marin Socials',
  about: "Social cricket at it's finest!",
  home_field: 'Piper Park, Larkspur',
  abbreviation: 'MNS'
}])

7.times do |n|
  name = Faker::Sports::Basketball.unique.team
  about = Faker::ChuckNorris.fact
  home_field = ['Fremont Park', 'Berkeley Oval', 'Magnusson Park']
  abbreviation = 'abc'
  Team.create!(
    name: name,
    about: about,
    home_field: home_field.sample,
    abbreviation: abbreviation
  )
end

p "added #{Team.count} teams"

schedule = Schedule.create([{
  date: Date.today + 2.weeks,
  home_team_id: 1,
  away_team_id: 4,
}, {
  date: Date.today + 1.week,
  home_team_id: 2,
  away_team_id: 5,
}, {
  date: Date.today,
  home_team_id: 3,
  away_team_id: 6,
}])

77.times do |n|
  date = Faker::Date.between(from: 2.months.from_now, to: 8.months.from_now)
  home_team_id = rand(1..10)
  away_team_id = rand(1..10)
  Schedule.create!(
    date: date,
    home_team_id: home_team_id,
    away_team_id: away_team_id,
  )
end

p "added #{Schedule.count} games"
