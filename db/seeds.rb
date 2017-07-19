User.destroy_all
ClassRoom.destroy_all
ClassSession.destroy_all
Survey.destroy_all

40.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    role: 'student',
    # password: 'password',
    # password_confirmation: 'password'
    # Classroom association?
    # Class Session association?
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
    # Classroom association?
    # Class session association?
  )
  puts user.first_name + " " + user.last_name + " got hired as an instructor."
end

# Create account: Mohammed
user = User.create!(
  first_name: 'Mohammed',
  last_name: 'Jaffal',
  email: 'm@b.com',
  role: 'instructor',
  # password: 'password',
  # password_confirmation: 'password'
)
puts user.first_name + " " + user.last_name + " got hired as an instructor."

# Create account: Ronen
user = User.create!(
  first_name: 'Ronen',
  last_name: 'Annason',
  email: 'r@a.com',
  role: 'instructor',
  # password: 'password',
  # password_confirmation: 'password'
)
puts user.first_name + " " + user.last_name + " got hired as an instructor."

# Create account: Mike
user = User.create!(
  first_name: 'Mike',
  last_name: 'Small',
  email: 'm@s.com',
  role: 'instructor',
  # password: 'password',
  # password_confirmation: 'password'
)
puts user.first_name + " " + user.last_name + " got hired as an instructor."
