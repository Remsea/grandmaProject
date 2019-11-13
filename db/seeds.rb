puts 'Cleaning database...'
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
    description: 'Passionnée de couture, j ai 2 petits enfants et 5 arrières petits-enfants',
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
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    price:       '50',
    address:     '5 rue Clotilde Bizolon 69002 Lyon',
    age:         '82',
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573645922/tzedp2yiquftxsngsjde.jpg"),
    # remote_photo_url:       "https://images.unsplash.com/photo-1525951859549-32572c477ed8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=354&q=80",
    competence_id: jardinage.id,
    user:        titi,
  )
yvette = Grandma.create!(
    name:        'Yvette',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    price:       '50',
    address:     'Champs Elysée Paris',
    age:         '71',
    # remote_photo_url:       "https://images.unsplash.com/photo-1544179932-fadfa08128a5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573646703/xqrn8xwt5vgmjddhmywv.jpg"),
    competence_id:  cuisine.id,
    user:        toto,
  )
simone = Grandma.create!(
    name:        'Simone',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    price:       '50',
    address:     'Antigone montpellier',
    age:         '90',
    # remote_photo_url:       "https://images.unsplash.com/photo-1547212371-eb5e6a4b590c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=80",
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573647055/slevqxe6jqu5sdmyyff2.jpg"),
    competence_id:  couture.id,
    user:        titi,
  )
henriette = Grandma.create!(
    name:        'Henriette',
    description: 'Passionnée de couture, j ai 2 petits enfants et 5 arrières petits-enfants',
    price:       '50',
    address:     '5 rue Clotilde Bizolon 69002 Lyon',
    age:         '72',
    # remote_photo_url:       "https://images.unsplash.com/photo-1526860918836-81de4cae5681?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573647432/njfxgtirlywgbkshmrw6.jpg"),
    competence_id:  tricot.id,
    user:        toto,
  )
solange = Grandma.create!(
    name:        'Solange',
    description: 'Passionnée de couture, j ai 2 petits enfants et 5 arrières petits-enfants',
    price:       '50',
    address:     '5 rue Clotilde Bizolon 69002 Lyon',
    age:         '85',
    photo:       Cloudinary::CarrierWave::StoredFile.new("image/upload/v1573647591/sauhmsophclgyjrdp3ah.jpg"),
    # remote_photo_url:       "https://images.unsplash.com/photo-1556889882-73ea40694a98?ixlib=rb-1.2.1&auto=format&fit=crop&w=776&q=80",
    competence_id:  cuisine.id,
    user:        titi,
  )
puts 'Finished!'
