puts "######################
    Cleaning DB...
######################
"

# Destroy Accesses
accesses = Access.all

accesses.each do |access|
  access.destroy!
end

# Destroy Rooms
rooms = Room.all

rooms.each do |room|
  room.destroy!
end

# Destroy Subjects
subjects = Subject.all

subjects.each do |subject|
  subject.destroy!
end

# Destroy Profiles
profiles = Profile.all

profiles.each do |profile|
  profile.destroy!
end

# Destroy Users
users = User.all

users.each do |user|
  user.destroy!
end

puts "DB cleaned"

puts "
######################
    Rebuilding DB...
######################
"

puts "Creating users..."
# Seed Users
user1 = User.new(email: "student@rocket.com", password: "azerty123456")
user1.save!

user2 = User.new(email: "teacher@rocket.com", password: "azerty123456", teacher: true)
user2.save!
puts "... #{User.count}/2 users created.
"

puts "Creating profiles..."
# Seed Profiles
profile1 = Profile.new(first_name: "Thomas", last_name: "Pesquet", gender: "Mr")
profile1.user = user1
profile1.save!

profile2 = Profile.new(first_name: "Buzz", last_name: "Aldrin", gender: "Mr")
profile2.user = user2
profile2.save!

puts "... #{Profile.count}/2 profiles created.
"

puts "Creating Subjects..."
# Seed Subjects
francais = Subject.new(name: "Français")
francais.user = user1
francais.save!

maths = Subject.new(name: "Mathématiques")
maths.user = user1
maths.save!

histoire = Subject.new(name: "Histoire")
histoire.user = user2
histoire.save!

geo = Subject.new(name: "Géographie")
geo.user = user2
geo.save!

puts "... #{Subject.count}/4 subjects created.
"

puts "Creating Rooms..."
# Seed Rooms
r1 = Room.new(level: "4e")
r1.subject = histoire
r1.save!

r2 = Room.new(level: "3e")
r2.subject = histoire
r2.save!

r3 = Room.new(level: "5e")
r3.subject = geo
r3.save!

r4 = Room.new(level: "4e")
r4.subject = geo
r4.save!

r5 = Room.new
r5.subject = francais
r5.save!

r6 = Room.new
r6.subject = maths
r6.save!


puts "... #{Room.count}/6 rooms created.
"

puts "Creating Accesses..."
# Seed Accesses
a1 = Access.new
a1.profile = profile2
a1.room = r1
a1.save!

a2 = Access.new
a2.profile = profile2
a2.room = r2
a2.save!

a3 = Access.new
a3.profile = profile2
a3.room = r3
a3.save!

a4 = Access.new
a4.profile = profile2
a4.room = r4
a4.save!

a5 = Access.new
a5.profile = profile1
a5.room = r5
a5.save!

a6 = Access.new
a6.profile = profile1
a6.room = r6
a6.save!

a7 = Access.new
a7.profile = profile1
a7.room = r1
a7.save!

a8 = Access.new
a8.profile = profile1
a8.room = r4
a8.save!

puts "... #{Access.count}/8 accesses created.
"

puts "
######################
      Test...
######################
"

puts "User.all :"
p User.all

puts "Profile.all :"
p Profile.all

puts "Subject.all :"
p Subject.all

puts "Room.all :"
p Room.all

puts "Access.all :"
p Access.all


puts "######################
   Seed completed ✅
######################
"
