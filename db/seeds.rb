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
  name: 'Marin 1',
  about: 'Competitive team playing in the NCCA league competition.',
  home_field: 'Piper Park, Larkspur',
  abbreviation: 'mno'
}, {
  name: 'Marin Bears T20',
  about: 'Competitive team playing in the NCCA T20 competition.',
  home_field: 'Piper Park, Larkspur',
  abbreviation: 'MnB'
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
  abbreviation = Faker::Name.initials(number: 3)
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

selections = Selection.create([{
  user_id: 1,
  schedule_id: 1
}, {
  user_id: 1,
  schedule_id: 2
}, {
  user_id: 1,
  schedule_id: 3
}, {
  user_id: 1,
  schedule_id: 4
}, {
  user_id: 1,
  schedule_id: 5
}, {
  user_id: 1,
  schedule_id: 6
}, {
  user_id: 1,
  schedule_id: 7
}, {
  user_id: 1,
  schedule_id: 8
}, {
  user_id: 1,
  schedule_id: 9
}, {
  user_id: 1,
  schedule_id: 10
}, {
  user_id: 2,
  schedule_id: 1
}, {
  user_id: 2,
  schedule_id: 2
}, {
  user_id: 2,
  schedule_id: 3
}, {
  user_id: 2,
  schedule_id: 4
}, {
  user_id: 2,
  schedule_id: 5
}, {
  user_id: 2,
  schedule_id: 6
}, {
  user_id: 2,
  schedule_id: 7
}, {
  user_id: 2,
  schedule_id: 8
}, {
  user_id: 2,
  schedule_id: 9
}, {
  user_id: 2,
  schedule_id: 10
}, {
  user_id: 3,
  schedule_id: 1
}, {
  user_id: 3,
  schedule_id: 2
}, {
  user_id: 3,
  schedule_id: 3
}, {
  user_id: 3,
  schedule_id: 4
}, {
  user_id: 3,
  schedule_id: 5
}, {
  user_id: 3,
  schedule_id: 6
}, {
  user_id: 3,
  schedule_id: 7
}, {
  user_id: 3,
  schedule_id: 8
}, {
  user_id: 3,
  schedule_id: 9
}, {
  user_id: 3,
  schedule_id: 10
}, {
  user_id: 4,
  schedule_id: 1
}, {
  user_id: 4,
  schedule_id: 2
}, {
  user_id: 4,
  schedule_id: 3
}, {
  user_id: 4,
  schedule_id: 4
}, {
  user_id: 4,
  schedule_id: 5
}, {
  user_id: 4,
  schedule_id: 6
}, {
  user_id: 4,
  schedule_id: 7
}, {
  user_id: 4,
  schedule_id: 8
}, {
  user_id: 4,
  schedule_id: 9
}, {
  user_id: 4,
  schedule_id: 10
}, {
  user_id: 5,
  schedule_id: 1
}, {
  user_id: 5,
  schedule_id: 2
}, {
  user_id: 5,
  schedule_id: 3
}, {
  user_id: 5,
  schedule_id: 4
}, {
  user_id: 5,
  schedule_id: 5
}, {
  user_id: 5,
  schedule_id: 6
}, {
  user_id: 5,
  schedule_id: 7
}, {
  user_id: 5,
  schedule_id: 8
}, {
  user_id: 5,
  schedule_id: 9
}, {
  user_id: 5,
  schedule_id: 10
}, {
  user_id: 6,
  schedule_id: 1
}, {
  user_id: 6,
  schedule_id: 2
}, {
  user_id: 6,
  schedule_id: 3
}, {
  user_id: 6,
  schedule_id: 4
}, {
  user_id: 6,
  schedule_id: 5
}, {
  user_id: 6,
  schedule_id: 6
}, {
  user_id: 6,
  schedule_id: 7
}, {
  user_id: 6,
  schedule_id: 8
}, {
  user_id: 6,
  schedule_id: 9
}, {
  user_id: 6,
  schedule_id: 10
}, {
  user_id: 7,
  schedule_id: 1
}, {
  user_id: 7,
  schedule_id: 2
}, {
  user_id: 7,
  schedule_id: 3
}, {
  user_id: 7,
  schedule_id: 4
}, {
  user_id: 7,
  schedule_id: 5
}, {
  user_id: 7,
  schedule_id: 6
}, {
  user_id: 7,
  schedule_id: 7
}, {
  user_id: 7,
  schedule_id: 8
}, {
  user_id: 7,
  schedule_id: 9
}, {
  user_id: 7,
  schedule_id: 10
}, {
  user_id: 8,
  schedule_id: 1
}, {
  user_id: 8,
  schedule_id: 2
}, {
  user_id: 8,
  schedule_id: 3
}, {
  user_id: 8,
  schedule_id: 4
}, {
  user_id: 8,
  schedule_id: 5
}, {
  user_id: 8,
  schedule_id: 6
}, {
  user_id: 8,
  schedule_id: 7
}, {
  user_id: 8,
  schedule_id: 8
}, {
  user_id: 8,
  schedule_id: 9
}, {
  user_id: 8,
  schedule_id: 10
}, {
  user_id: 9,
  schedule_id: 1
}, {
  user_id: 9,
  schedule_id: 2
}, {
  user_id: 9,
  schedule_id: 3
}, {
  user_id: 9,
  schedule_id: 4
}, {
  user_id: 9,
  schedule_id: 5
}, {
  user_id: 9,
  schedule_id: 6
}, {
  user_id: 9,
  schedule_id: 7
}, {
  user_id: 9,
  schedule_id: 8
}, {
  user_id: 9,
  schedule_id: 9
}, {
  user_id: 9,
  schedule_id: 10
}, {
  user_id: 10,
  schedule_id: 1
}, {
  user_id: 10,
  schedule_id: 2
}, {
  user_id: 10,
  schedule_id: 3
}, {
  user_id: 10,
  schedule_id: 4
}, {
  user_id: 10,
  schedule_id: 5
}, {
  user_id: 10,
  schedule_id: 6
}, {
  user_id: 10,
  schedule_id: 7
}, {
  user_id: 10,
  schedule_id: 8
}, {
  user_id: 10,
  schedule_id: 9
}, {
  user_id: 10,
  schedule_id: 10
}])

p "added #{Selection.count} selections"

5.times do |event|
  title = Faker::Book.title
  location = Faker::Address.street_name
  date = Faker::Date.between(from: 3.months.ago, to: 7.days.ago)
  start_time = Time.now - 6.hours
  end_time = Time.now - 4.hours
  about = Faker::Movies::PrincessBride.quote
  Event.create!(
    title: title,
    location: location,
    date: date,
    start_time: start_time,
    end_time: end_time,
    about: about
  )
end

5.times do |event|
  title = Faker::Book.title
  location = Faker::Address.street_name
  date = Faker::Date.between(from: Date.today + 7.days, to: 3.months.from_now)
  start_time = Time.now - 6.hours
  end_time = Time.now - 4.hours
  about = Faker::Movies::PrincessBride.quote
  Event.create!(
    title: title,
    location: location,
    date: date,
    start_time: start_time,
    end_time: end_time,
    about: about
  )
end

p "added #{Event.count} events"