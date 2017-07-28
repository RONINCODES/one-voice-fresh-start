# Clear out table data:
ClassSession.destroy_all
Survey.destroy_all
User.destroy_all
# ClassRoom.destroy_all -- Throws a mysterious error.

# Create student accounts:
40.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    role: 'student',
    password: 'password',
    password_confirmation: 'password'
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
    password: 'password',
    password_confirmation: 'password'
  )
  puts "New instructor: " + user.first_name + " " + user.last_name
  5.times do
    class_room = ClassRoom.create!(
      subject: Faker::Educator.course,
      group_code: Faker::Number.digit.to_i,
      user_id: user.id
    )
    puts "New classroom: " + class_room.subject + " (Instructor: " + User.find_by(id: class_room.user_id).first_name + " " + User.find_by(id: class_room.user_id).last_name + ")"
      3.times do
        class_session = class_room.class_sessions.create!(
        date: class_room.created_at + rand(1000000000),
        agenda: Faker::Job.key_skill,
        user_id: class_room.user_id
        )
        10.times do
          survey = class_session.surveys.create!(
          helpfulness: rand(1..5).to_s,
          clarity: rand(1..5).to_s,
          pace: rand(1..5).to_s,
          suggestions: Faker::Simpsons.quote,
          user_id: User.where(role: 'student').all.sample.id
          )

        end
      end
    end



end

# Create account: Mohammed
user = User.create!(
  first_name: 'Mohammed',
  last_name: 'Jaffal',
  email: 'm@b.com',
  role: 'instructor',
  password: 'password',
  password_confirmation: 'password'
)
puts "New instructor (MJ): " + user.first_name + " " + user.last_name

# Create account: Ronen
user = User.create!(
  first_name: 'Ronen',
  last_name: 'Annason',
  email: 'r@a.com',
  role: 'instructor',
  password: 'password',
  password_confirmation: 'password'
)
puts "New instructor (RA): " + user.first_name + " " + user.last_name

# Create account: Mike
user = User.create!(
  first_name: 'Mike',
  last_name: 'Small',
  email: 'm@s.com',
  role: 'instructor',
  password: 'password',
  password_confirmation: 'password'
)
puts "New instructor (MS): " + user.first_name + " " + user.last_name
