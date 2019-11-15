puts 'Cleaning database...'
Transaction.destroy_all
Grandma.destroy_all
User.destroy_all
Competence.destroy_all


puts 'Creating user'
toto = User.create!(
  email: 'eva.guillen6@gmail.com',
  password: "azertyuiop",
  first_name: "Toto",
  last_name: "Dupont"
  )
titi = User.create!(
  email: 'a@a.com',
  password: "azertyuiop",
  first_name: "Titi",
  last_name: "Ducret"
  )

puts 'Creating competences'
Competence.create(name: 'Toutes')
couture = Competence.create(name: 'Couture')
cuisine =Competence.create(name: 'Cuisine')
jardinage = Competence.create(name: 'Jardinage')
tricot = Competence.create(name: 'Tricot')
Competence.create(name: 'Lecture')
Competence.create(name: 'Massage')
Competence.create(name: 'Poterie')


puts 'Creating grandmas...'
delphine = Grandma.create!(
    name:        'Delphine',
    description: "Couturière de formation, avec plus de 50 ans d'expérience à mon actif, je serais heureuse de vous transmettre mes connaissances à ce sujet !",
    price:       '50',
    address:     '55 chemin du moulin 38330 Montbonnot',
    age:         '90',
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573645921/l1ymj0tsdh3bummur0fw.jpg"),
    # remote_photo_url:       "https://images.unsplash.com/flagged/photo-1570084787226-c77bdc6a1705?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    competence_id: couture.id,
    user:        toto
  )
suzanne = Grandma.create!(
    name:        'Suzanne',
    description: "Heureuse grand-mère de 5 adorables bambins, je vous propose de vous apprendre à bichonner votre jardin et vos plantes d'intérieur.",
    price:       '45',
    address:     '5 rue Clotilde Bizolon 69002 Lyon',
    age:         '82',
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573645922/tzedp2yiquftxsngsjde.jpg"),
    # remote_photo_url:       "https://images.unsplash.com/photo-1525951859549-32572c477ed8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=354&q=80",
    competence_id: jardinage.id,
    user:        titi
  )
yvette = Grandma.create!(
    name:        'Yvette',
    description: "Ancienne chef de cuisine dynamique et passionnée de gastronomie, je vous propose de partager mes connaissances pour éveiller les papilles de toute votre famille !",
    price:       '50',
    address:     'Champs Elysée Paris',
    age:         '67',
    # remote_photo_url:       "https://images.unsplash.com/photo-1544179932-fadfa08128a5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573646703/xqrn8xwt5vgmjddhmywv.jpg"),
    competence_id:  cuisine.id,
    user:        toto
  )
simone = Grandma.create!(
    name:        'Simone',
    description: "Passionnée de couture depuis ma plus tendre enfance, je vous propose des cours en toute simplicité à mon domicile. Matériel fourni.",
    price:       '50',
    address:     'Antigone montpellier',
    age:         '90',
    # remote_photo_url:       "https://images.unsplash.com/photo-1547212371-eb5e6a4b590c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573647055/slevqxe6jqu5sdmyyff2.jpg"),
    competence_id:  couture.id,
    user:        titi
  )
henriette = Grandma.create!(
    name:        'Henriette',
    description: "Pulls, gants, écharpes... Rejoignez-moi pour apprendre le tricot autour d'un thé et de bons petits gâteaux maison.",
    price:       '50',
    address:     '8 rue Clotilde Bizolon 69002 Lyon',
    age:         '72',
    # remote_photo_url:       "https://images.unsplash.com/photo-1526860918836-81de4cae5681?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573647432/njfxgtirlywgbkshmrw6.jpg"),
    competence_id:  tricot.id,
    user:        toto
  )
solange = Grandma.create!(
    name:        'Solange',
    description: "Je vous propose des cours de cuisine afin d'apprendre à préparer les grands classiques de la gastronomie française. Je vous accueille à mon domicile, afin d'avoir tout le matériel nécessaire à disposition.",
    price:       '50',
    address:     '20 rue Clotilde Bizolon 69002 Lyon',
    age:         '85',
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573647591/sauhmsophclgyjrdp3ah.jpg"),
    # remote_photo_url:       "https://images.unsplash.com/photo-1556889882-73ea40694a98?ixlib=rb-1.2.1&auto=format&fit=crop&w=776&q=80",
    competence_id:  cuisine.id,
    user:        titi
  )
jeanne = Grandma.create!(
    name:        'Jeanne',
    description: "Chaussettes, gants, écharpes... Rejoignez-moi pour apprendre le tricot autour d'un thé et de bons petits gâteaux maison. Merci de venir avec votre laine, je m'occupe des aiguilles !",
    price:       '30',
    address:     '44 rue Mercière Lyon',
    age:         '75',
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573828591/vbpzjyqebfame4alqkve.jpg"),
    #remote_photo_url:       "https://images.unsplash.com/photo-1566616213894-2d4e1baee5d8?ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80",
    competence_id:  tricot.id,
    user:        toto
  )
andree = Grandma.create!(
    name:        'Andrée',
    description: "Le tricot, c'est une grande aventure que je vous propose de découvrir en ma compagnie ! Avec du thé et de bons petits gâteaux maison. Merci de venir avec votre laine, je m'occupe des aiguilles !",
    price:       '55',
    address:     '9 rue du Mail Lyon',
    age:         '82',
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573829086/bedf5njo8d9ojx2csazq.jpg"),
    #remote_photo_url:       "https://images.unsplash.com/photo-1539527073261-80acb74db86e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    competence_id:  tricot.id,
    user:        toto
  )
audette = Grandma.create!(
    name:        'Audette',
    description: "Pulls, gants, écharpes... Rejoignez-moi pour apprendre le tricot autour d'un thé et de bons petits gâteaux maison. Merci de venir avec votre laine, je m'occupe des aiguilles !",
    price:       '55',
    address:     '20 rue des Capucins Lyon',
    age:         '69',
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573829519/ouyqovvuvdwsrroyuv5e.jpg"),
    #remote_photo_url:       "https://images.unsplash.com/photo-1422015347944-9dd46d16bd0b?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
    competence_id:  tricot.id,
    user:        toto
  )

puts 'Creating transactions...'
transaction1 = Transaction.create!(
  grandma:      delphine,
  user:         toto,
  rentaldate:    '10.03.2020')

  transaction2 = Transaction.create!(
  grandma:       solange,
  user:         toto,
  rentaldate:    '08.08.2020')

  transaction3 = Transaction.create!(
  grandma:       henriette,
  user:          titi,
  rentaldate:    '03.02.2020')

  transaction4 = Transaction.create!(
  grandma:       simone,
  user:          titi,
  rentaldate:    '09.02.2020')

  transaction5 = Transaction.create!(
  grandma:       yvette,
  user:          titi,
  rentaldate:    '12.05.2020')

  transaction6 = Transaction.create!(
  grandma:       jeanne,
  user:          titi,
  rentaldate:    '17.11.2019')

  transaction7 = Transaction.create!(
  grandma:       andree,
  user:          titi,
  rentaldate:    '17.11.2019')

puts 'Finished!'
