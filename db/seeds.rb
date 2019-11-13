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
    photo:       'https://unsplash.com/photos/MTg6nH8_lOY',
    competence_id: couture.id,
    user:        toto
  )
suzanne = Grandma.create!(
    name:        'Suzanne',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    price:       '50',
    address:     '5 rue Clotilde Bizolon 69002 Lyon',
    age:         '82',
    photo:       'https://unsplash.com/photos/y0I85D5QKvs',
    competence_id: jardinage.id,
    user:        titi,
  )
yvette = Grandma.create!(
    name:        'Yvette',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    price:       '50',
    address:     'Champs Elysée Paris',
    age:         '71',
    photo:       'https://unsplash.com/photos/38KSErAzoVw',
    competence_id:  cuisine.id,
    user:        toto,
  )
simone = Grandma.create!(
    name:        'Simone',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    price:       '50',
    address:     'Antigone montpellier',
    age:         '90',
    photo:       'https://unsplash.com/photos/MTg6nH8_lOY',
    competence_id:  couture.id,
    user:        titi,
  )
henriette = Grandma.create!(
    name:        'Henriette',
    description: 'Passionnée de couture, j ai 2 petits enfants et 5 arrières petits-enfants',
    price:       '50',
    address:     '5 rue Clotilde Bizolon 69002 Lyon',
    age:         '72',
    photo:       'https://unsplash.com/photos/jsQqiDYbsN0',
    competence_id:  tricot.id,
    user:        toto,
  )
solange = Grandma.create!(
    name:        'Solange',
    description: 'Passionnée de couture, j ai 2 petits enfants et 5 arrières petits-enfants',
    price:       '50',
    address:     '5 rue Clotilde Bizolon 69002 Lyon',
    age:         '85',
    photo:       'https://unsplash.com/photos/MTg6nH8_lOY',
    competence_id:  cuisine.id,
    user:        titi,
  )
puts 'Finished!'
