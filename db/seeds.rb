# Clear out table data:
User.destroy_all
# ClassRoom.destroy_all
ClassSession.destroy_all
Survey.destroy_all

# Create student accounts:
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
  puts "New student: " + user.first_name + " " + user.last_name
end

# Create instructor accounts:
20.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    role: 'instructor',
    # password: 'password',
    # password_confirmation: 'password'
    # Classroom association?
    # Class session association?
  )
  puts "New instructor: " + user.first_name + " " + user.last_name
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
puts "New instructor: " + user.first_name + " " + user.last_name

# Create account: Ronen
user = User.create!(
  first_name: 'Ronen',
  last_name: 'Annason',
  email: 'r@a.com',
  role: 'instructor',
  # password: 'password',
  # password_confirmation: 'password'
)
puts "New instructor: " + user.first_name + " " + user.last_name

# Create account: Mike
user = User.create!(
  first_name: 'Mike',
  last_name: 'Small',
  email: 'm@s.com',
  role: 'instructor',
  # password: 'password',
  # password_confirmation: 'password'
)
puts "New instructor: " + user.first_name + " " + user.last_name

# Create ClassRooms
10.times do
  class_room = ClassRoom.create!(
    subject: Faker::Educator.course,
    group_code: Faker::Number.digit.to_i,
    user_id: User.where(role: 'instructor').all.sample.id
  )
  puts "New classroom: " + class_room.subject + " (Instructor: " + User.find_by(id: class_room.user_id).last_name + " " + User.find_by(id: class_room.user_id).last_name + ")"
end
