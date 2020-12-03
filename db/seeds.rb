puts "######################
    Cleaning DB...
######################
"

# # Destroy Accesses
# accesses = Access.all

# accesses.each do |access|
#   access.destroy!
# end

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
r1.user = histoire.user
r1.save!

r2 = Room.new(level: "3e")
r2.subject = histoire
r2.user = histoire.user
r2.save!

r3 = Room.new(level: "5e")
r3.subject = geo
r3.user = geo.user
r3.save!

r4 = Room.new(level: "4e")
r4.subject = geo
r4.user = geo.user
r4.save!

r5 = Room.new
r5.subject = francais
r5.user = francais.user
r5.save!

r6 = Room.new
r6.subject = maths
r6.user = maths.user
r6.save!


puts "... #{Room.count}/6 rooms created.
"

puts "Creating Accesses..."
# Seed Accesses
a1 = Access.new
a1.user = user2
a1.room = r1
a1.save!

a2 = Access.new
a2.user = user2
a2.room = r2
a2.save!

a3 = Access.new
a3.user = user2
a3.room = r3
a3.save!

a4 = Access.new
a4.user = user2
a4.room = r4
a4.save!

a5 = Access.new
a5.user = user1
a5.room = r5
a5.save!

a6 = Access.new
a6.user = user1
a6.room = r6
a6.save!

a7 = Access.new
a7.user = user1
a7.room = r1
a7.save!

a8 = Access.new
a8.user = user1
a8.room = r4
a8.save!

puts "... #{Access.count}/8 accesses created.
"

puts "Creating Chapters..."
# Seed Chapters
c1 = Chapter.new(name: "La Révolution Française")
c1.user = user2
c1.room = r1
c1.subject = r1.subject
c1.save!

c2 = Chapter.new(name: "Le Monde au XVIIIe Siècle")
c2.user = user2
c2.room = r1
c2.subject = r1.subject
c2.save!

c3 = Chapter.new(name: "La Révolution Industrielle")
c3.user = user2
c3.room = r1
c3.subject = r1.subject
c3.save!

c4 = Chapter.new(name: "La Première Guerre Mondiale")
c4.user = user2
c4.room = r2
c4.subject = r2.subject
c4.save!

c5 = Chapter.new(name: "La Seconde Guerre Mondiale")
c5.user = user2
c5.room = r2
c5.subject = r2.subject
c5.save!

c6 = Chapter.new(name: "La Guerre Froide")
c6.user = user2
c6.room = r2
c6.subject = r2.subject
c6.save!

c7 = Chapter.new(name: "Peuplement de la Planète")
c7.user = user2
c7.room = r3
c7.subject = r3.subject
c7.save!

c8 = Chapter.new(name: "Problémtiques environnementales")
c8.user = user2
c8.room = r3
c8.subject = r3.subject
c8.save!

c9 = Chapter.new(name: "La Mondialisation")
c9.user = user2
c9.room = r4
c9.subject = r4.subject
c9.save!

c10 = Chapter.new(name: "Espaces d'échange")
c10.user = user2
c10.room = r4
c10.subject = r4.subject
c10.save!

c11 = Chapter.new(name: "Poésie")
c11.user = user1
c11.room = r5
c11.subject = r5.subject
c11.save!

c12 = Chapter.new(name: "Lecture")
c12.user = user1
c12.room = r5
c12.subject = r5.subject
c12.save!

c13 = Chapter.new(name: "Pythagore")
c13.user = user1
c13.room = r6
c13.subject = r6.subject
c13.save!

c14 = Chapter.new(name: "Thalès")
c14.user = user1
c14.room = r6
c14.subject = r6.subject
c14.save!

c15 = Chapter.new(name: "Les cercles")
c15.user = user1
c15.room = r6
c15.subject = r6.subject
c15.save!


puts "... #{Chapter.count}/15 chapters created.
"


puts "Creating Missions..."
# Seed Missions
m1 = Mission.new(name: "Tensions pré-Révolution")
m1.user = user2
m1.chapter = c1
m1.save!

m2 = Mission.new(name: "La Prise de la Bastille")
m2.user = user2
m2.chapter = c1
m2.save!


m3 = Mission.new(name: "Les Lumières")
m3.user = user2
m3.chapter = c2
m3.save!


m3 = Mission.new(name: "Des conflits entre puissances")
m3.user = user2
m3.chapter = c2
m3.save!

m4 = Mission.new(name: "Révolution Agricole")
m4.user = user2
m4.chapter = c3
m4.save!

m5 = Mission.new(name: "Les secteurs clés")
m5.user = user2
m5.chapter = c3
m5.save!

m6 = Mission.new(name: "La suprématie de la Grande-Bretagne")
m6.user = user2
m6.chapter = c3
m6.save!

m7 = Mission.new(name: "Singularité du cas Français")
m7.user = user2
m7.chapter = c3
m7.save!

m8 = Mission.new(name: "La génèse du conflit")
m8.user = user2
m8.chapter = c4
m8.save!

m9 = Mission.new(name: "Guerre de mouvement")
m9.user = user2
m9.chapter = c4
m9.save!

m10 = Mission.new(name: "Guerre de position")
m10.user = user2
m10.chapter = c4
m10.save!

m11 = Mission.new(name: "Fin des combats")
m11.user = user2
m11.chapter = c4
m11.save!

m12 = Mission.new(name: "Origines du conflit")
m12.user = user2
m12.chapter = c5
m12.save!

m13 = Mission.new(name: "Membres de l'Axe")
m13.user = user2
m13.chapter = c5
m13.save!

m14 = Mission.new(name: "Les Alliés")
m14.user = user2
m14.chapter = c5
m14.save!

m15 = Mission.new(name: "La puissance aéronautique")
m15.user = user2
m15.chapter = c5
m15.save!

m14 = Mission.new(name: "Batailles Historiques")
m14.user = user2
m14.chapter = c5
m14.save!

m15 = Mission.new(name: "USA et fin du conflit")
m15.user = user2
m15.chapter = c5
m15.save!

m16 = Mission.new(name: "Origine de la Guerre Froide")
m16.user = user2
m16.chapter = c6
m16.save!

m17 = Mission.new(name: "Bloc de l'Est")
m17.user = user2
m17.chapter = c6
m17.save!

m18 = Mission.new(name: "Bloc de l'Ouest")
m18.user = user2
m18.chapter = c6
m18.save!

m19 = Mission.new(name: "Asie")
m19.user = user2
m19.chapter = c7
m19.save!

m20 = Mission.new(name: "Europe")
m20.user = user2
m20.chapter = c7
m20.save!

m21 = Mission.new(name: "Amérique")
m21.user = user2
m21.chapter = c7
m21.save!

m22 = Mission.new(name: "Une population en augmentation")
m22.user = user2
m22.chapter = c8
m22.save!

m23 = Mission.new(name: "Zones de tensions")
m23.user = user2
m23.chapter = c8
m23.save!

m24 = Mission.new(name: "De nouvelles interfaces")
m24.user = user2
m24.chapter = c9
m24.save!

m25 = Mission.new(name: "Les Nords et les Suds")
m25.user = user2
m25.chapter = c9
m25.save!

m26 = Mission.new(name: "Les différentes puissances")
m26.user = user2
m26.chapter = c9
m26.save!

m27 = Mission.new(name: "Les enjeux")
m27.user = user2
m27.chapter = c10
m27.save!

m28 = Mission.new(name: "Les différents flux")
m28.user = user2
m28.chapter = c10
m28.save!

m29 = Mission.new(name: "Les courants")
m29.user = user1
m29.chapter = c11
m29.save!

m30 = Mission.new(name: "Rimbaud et Romantisme")
m30.user = user1
m30.chapter = c11
m30.save!

m31 = Mission.new(name: "Les Misérables")
m31.user = user1
m31.chapter = c12
m31.save!

m32 = Mission.new(name: "Le Tour du Monde en 80 jours")
m32.user = user1
m32.chapter = c12
m32.save!



puts "... #{Mission.count}/15 missions created.
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

puts "Chapter.all :"
p Chapter.all


puts "######################
   Seed completed ✅
######################
"
