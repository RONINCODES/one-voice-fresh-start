User.destroy_all
ClassRoom.destroy_all
ClassSession.destroy_all
Survey.destroy_all

100.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    role: 'student',
    # password: 'password',
    # password_confirmation: 'password'
  )
  puts user.first_name + " " + user.last_name + " registered as a student."
end

20.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    role: 'student',
    # password: 'password',
    # password_confirmation: 'password'
  )
  puts user.first_name + " " + user.last_name + " got hired as an instructor."
end
