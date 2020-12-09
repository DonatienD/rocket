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

# a8 = Access.new
# a8.user = user1
# a8.room = r4
# a8.save!

puts "... #{Access.count}/7 accesses created.
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

c8 = Chapter.new(name: "Problématiques environnementales")
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


m4 = Mission.new(name: "Des conflits entre puissances")
m4.user = user2
m4.chapter = c2
m4.save!

m5 = Mission.new(name: "Révolution Agricole")
m5.user = user2
m5.chapter = c3
m5.save!

m6 = Mission.new(name: "Les secteurs clés")
m6.user = user2
m6.chapter = c3
m6.save!

m7 = Mission.new(name: "La suprématie de la Grande-Bretagne")
m7.user = user2
m7.chapter = c3
m7.save!

m8 = Mission.new(name: "Singularité du cas Français")
m8.user = user2
m8.chapter = c3
m8.save!

m9 = Mission.new(name: "La génèse du conflit")
m9.user = user2
m9.chapter = c4
m9.save!

m10 = Mission.new(name: "Guerre de mouvement")
m10.user = user2
m10.chapter = c4
m10.save!

m11 = Mission.new(name: "Guerre de position")
m11.user = user2
m11.chapter = c4
m11.save!

m12 = Mission.new(name: "Fin des combats")
m12.user = user2
m12.chapter = c4
m12.save!

m13 = Mission.new(name: "Origines du conflit")
m13.user = user2
m13.chapter = c5
m13.save!

m14 = Mission.new(name: "Membres de l'Axe")
m14.user = user2
m14.chapter = c5
m14.save!

m15 = Mission.new(name: "Les Alliés")
m15.user = user2
m15.chapter = c5
m15.save!

m16 = Mission.new(name: "La puissance aéronautique")
m16.user = user2
m16.chapter = c5
m16.save!

m17 = Mission.new(name: "Batailles Historiques")
m17.user = user2
m17.chapter = c5
m17.save!

m18 = Mission.new(name: "USA et fin du conflit")
m18.user = user2
m18.chapter = c5
m18.save!

m19 = Mission.new(name: "Origine de la Guerre Froide")
m19.user = user2
m19.chapter = c6
m19.save!

m20 = Mission.new(name: "Bloc de l'Est")
m20.user = user2
m20.chapter = c6
m20.save!

m21 = Mission.new(name: "Bloc de l'Ouest")
m21.user = user2
m21.chapter = c6
m21.save!

m22 = Mission.new(name: "Asie")
m22.user = user2
m22.chapter = c7
m22.save!

m23 = Mission.new(name: "Europe")
m23.user = user2
m23.chapter = c7
m23.save!

m24 = Mission.new(name: "Amérique")
m24.user = user2
m24.chapter = c7
m24.save!

m25 = Mission.new(name: "Une population en augmentation")
m25.user = user2
m25.chapter = c8
m25.save!

m26 = Mission.new(name: "Zones de tensions")
m26.user = user2
m26.chapter = c8
m26.save!

m27 = Mission.new(name: "De nouvelles interfaces")
m27.user = user2
m27.chapter = c9
m27.save!

m28 = Mission.new(name: "Les Nords et les Suds")
m28.user = user2
m28.chapter = c9
m28.save!

m29 = Mission.new(name: "Les différentes puissances")
m29.user = user2
m29.chapter = c9
m29.save!

m30 = Mission.new(name: "Les enjeux")
m30.user = user2
m30.chapter = c10
m30.save!

m31 = Mission.new(name: "Les différents flux")
m31.user = user2
m31.chapter = c10
m31.save!

m32 = Mission.new(name: "Les courants")
m32.user = user1
m32.chapter = c11
m32.save!

m33 = Mission.new(name: "Rimbaud et Romantisme")
m33.user = user1
m33.chapter = c11
m33.save!

m34 = Mission.new(name: "Les Misérables")
m34.user = user1
m34.chapter = c12
m34.save!

m35 = Mission.new(name: "Le Tour du Monde en 80 jours")
m35.user = user1
m35.chapter = c12
m35.save!

m36 = Mission.new(name: "Les formules")
m36.user = user1
m36.chapter = c13
m36.save

m37 = Mission.new(name: "Les formules")
m37.user = user1
m37.chapter = c14
m37.save!

m38 = Mission.new(name: "Les formules")
m38.user = user1
m38.chapter = c15
m38.save!

puts "... #{Mission.count}/38 missions created.
"


puts "Creating Flashcards..."
# Seed Flashcards
f1 = Flashcard.new(
  question: "À quelle date s'ouvrent les états généraux ?",
  answer: "05 mai 1789")
f1.user = user2
f1.mission = m1
f1.save!

f2 = Flashcard.new(
  question: "Quelle part de la population représente le Clergé ?",
  answer: "0,5 %")
f2.user = user2
f2.mission = m1
f2.save!

f3 = Flashcard.new(
  question: "Comment s'appelle le régime politique jusqu'en 1789 ?",
  answer: "La monarchie absolue de droit divin.")
f3.user = user2
f3.mission = m1
f3.save!

f4 = Flashcard.new(
  question: "En quelle année les États-Unis déclarent-ils leur indépendance contre la couronne britannique ?",
  answer: "1776")
f4.user = user2
f4.mission = m1
f4.save!

f5 = Flashcard.new(
  question: "Lequel de ces philosophes n'est pas considéré comme philosophe des Lumières ?
  Voltaire - Diderot - Monstequieux - Rousseau - Marx",
  answer: "Marx")
f5.user = user2
f5.mission = m1
f5.save!

f6 = Flashcard.new(
  question: "Quel avocat et journaliste interpelle la foule et l'appelle à « prendre les armes contre le gouvernement du roi » ?",
  answer: "Camille Desmoulins")
f6.user = user2
f6.mission = m2
f6.save!

f7 = Flashcard.new(
  question: "Combien de prisonniers étaient retenus dans la prison de la Bastille ?",
  answer: "7")
f7.user = user2
f7.mission = m2
f7.save!

f8 = Flashcard.new(
  question: "Où se trouve Louis XVI le 14 juillet 1789 au matin ?",
  answer: "À la chasse")
f8.user = user2
f8.mission = m2
f8.save!

f9 = Flashcard.new(
  question: "À qui doit-on la citation : « Allez dire à votre maître que nous sommes ici par la volonté du peuple et qu’on ne nous en arrachera que par la puissance des baïonnettes. » ?",
  answer: "Comte de Mirabeau")
f9.user = user2
f9.mission = m2
f9.save!

f10 = Flashcard.new(
  question: "À quelle heure les prisonniers sont-ils libérés ?",
  answer: "17h")
f10.user = user2
f10.mission = m2
f10.save!

f11 = Flashcard.new(
  question: "Qu'est ce que la délocalisation ?",
  answer: "La délocalisation est un transfert d'activités, de capitaux et d'emplois vers des régions offrant des avantages compétitifs (en particulier une main-d’œuvre bon marché).")
f11.user = user2
f11.mission = m27
f11.save!

f12 = Flashcard.new(
  question: "Qu'est-ce que la littoralisation ?",
  answer: "C'est un mouvement de concentration des hommes et des activités sur les littoraux ou littoralisation.")
f12.user = user2
f12.mission = m27
f12.save!

f13 = Flashcard.new(
  question: "Que signifie ZIP ?",
  answer: "Zones industialo-portuaires")
f13.user = user2
f13.mission = m27
f13.save!

f14 = Flashcard.new(
  question: "Où se situe le Northern Range ?",
  answer: "Sur la Manche et la Mer du Nord, c'est une façade maritime active.")
f14.user = user2
f14.mission = m27
f14.save!

f15 = Flashcard.new(
  question: "Qui sont les altermondialistes ?",
  answer: "Depuis les années 1990, les altermondialistes dénoncent les injustices sociales et les dégâts écologiques qui seraient provoquées par la mondialisation.")
f15.user = user2
f15.mission = m27
f15.save!

f16 = Flashcard.new(
  question: "Quels sont les effets positifs de la délocalisation ?",
  answer: "• Augmentation du pouvoir d’achat car baisse des prix.
  • Création d'emplois car hausse de la demande et donc augmentation des parts de marché.
  • Nouvelles zones d’activités comme les zones franches.")
f16.user = user2
f16.mission = m27
f16.save!

f17 = Flashcard.new(
  question: "Quels sont les effets negatifs de la délocalisation ?",
  answer: "• Destructions d'emplois et chômage dans le Nord.
  • Aggravation des conditions de travail pour faire face à la concurrence.
  • Développement de friches industrielle. Perte d’identité culturelle. Conditions de travail difficiles dans le Sud
  • Dépendance vis-à-vis des pays développés du Nord.")
f17.user = user2
f17.mission = m27
f17.save!

f18 = Flashcard.new(
  question: "Qu'est-ce que le « Hard Power » ?",
  answer: "Le hard power désigne l'influence d'un Etat par des moyens politiques, militaires ou économiques. ")
f18.user = user2
f18.mission = m27
f18.save!

f19 = Flashcard.new(
  question: "Quel pays est le plus gros producteur mondial ?",
  answer: "Les États-Unis d'Amérique")
f19.user = user2
f19.mission = m27
f19.save!

f20 = Flashcard.new(
  question: "Que signifie PMA ?",
  answer: "Pays les Moins Avancés")
f20.user = user2
f20.mission = m28
f20.save!

f21 = Flashcard.new(
  question: "Que sont les états pétroliers ?",
  answer: "Les états du Moyen-Orient et d'Asie Centrale qui tirent leurs richesses de l'exploitation des hydrocarbures.")
f21.user = user2
f21.mission = m28
f21.save!

f22 = Flashcard.new(
  question: "Qu'est ce que l'IDH ? ",
  answer: "L'indice de développement humain.
    L'IDH est un indice qui se fonde à la fois sur l'espérance de vie à la naissance, le niveau de vie et le niveau de l'éducation.")
f22.user = user2
f22.mission = m28
f22.save!

f23 = Flashcard.new(
  question: "Quels sont les « pays ateliers » ?",
  answer: "Mexique, Maghreb, Turquie et pays d'Asie du Sud-Est")
f23.user = user2
f23.mission = m28
f23.save!

f24 = Flashcard.new(
  question: "Quels déséquilibres a entrainés la mondialisation ? ",
  answer: "Elle a accentué les disparités entre les populations urbaines et les populations rurales, entre les catégories instruites et celles qui ne peuvent avoir accès à l'éducation.")
f24.user = user2
f24.mission = m28
f24.save!

f25 = Flashcard.new(
  question: "De quoi dépendent les « pays ateliers » ?",
  answer: "Les « pays ateliers » dépendent des carnets de commandes des pays riches (États-Unis, Union Européenne, Japon... ). ")
f25.user = user2
f25.mission = m28
f25.save!

f26 = Flashcard.new(
  question: "Quels sont les pays émergents ?",
  answer: "Les pays émergents sont des pays en transition : entre Sud et Nord, ils accomplissent à leur rythme le parcours que les États du Nord ont accomplis au 19e siècle au moment de la Révolution Industrielle. Ce sont toutefois de véritables concurrents pour les pays riches. ")
f26.user = user2
f26.mission = m28
f26.save!

f27 = Flashcard.new(
  question: "Citer les principaux poétes du mouvement romantique ?",
  answer: "Alphonse de Lamartine (1790-1869),
    Alfred de Vigny (1797-1863),
    Alfred de Musset (1810-1857)")
f27.user = user1
f27.mission = m32
f27.save!

f28 = Flashcard.new(
  question: "Quels messages essaient de faire passer les poètes du mouvement romantique ?",
  answer: "Le poète romantique tente d'exprimer le « Mal du siècle » et de proposer à celui qui le ressent une analyse et une évasion dans un monde plus propice à l'épanouissement de la sensibilité.")
f28.user = user1
f28.mission = m32
f28.save!

f29 = Flashcard.new(
  question: "Qu'est-ce que Le Parnasse ?",
  answer: "Le Parnasse apparaît en réaction contre la « sensiblerie » romantique. Ce courant refuse à cette dernière son expression des sentiments pour se consacrer à une poésie plus formelle.")
f29.user = user1
f29.mission = m32
f29.save!

puts "... #{Flashcard.count}/29 flashcards created.
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

puts "Mission.all :"
p Mission.all

puts "Flashcard.all :"
p Flashcard.all


puts "######################
   Seed completed ✅
######################
"
