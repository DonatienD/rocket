puts "######################
    Cleaning DB...
######################
"

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

puts "
######################
      Test...
######################
"

puts "User.all :"
p User.all


puts "######################
   Seed completed ✅
######################
"
