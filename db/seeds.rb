# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# add user
User.create!(name: 'Marcelo', email: 'marcelo@gmail.com', password: '123456', access_level: 0)
User.create!(name: 'Admin', email: 'admin@gmail.com', password: '123456', access_level: 1)

puts 'Usuário criado com sucesso!'

# add books stephen king
book1 = Book.new(
  title: 'It',
  author: 'Stephen King',
  description: 'It is a 1986 horror novel by American author Stephen King. It was his 22nd book, and his 18th novel written under his own name. The story follows the experiences of seven children as they are terrorized by an evil entity that exploits the fears of its victims to disguise itself while hunting its prey. "It" primarily appears in the form of Pennywise the Dancing Clown to attract its preferred prey of young children.',
  rating: 5,
  price: 49.99,
)
book1.image.attach(io: File.open("#{Rails.root}/app/assets/images/it.jpg"), filename: "it.jpg")
book1.save!

book2 = Book.new(
  title: 'The Shining',
  author: 'Stephen King',
  description: 'The Shining is a horror novel by American author Stephen King. Published in 1977, it is King\'s third published novel and first hardback bestseller: the success of the book firmly established King as a preeminent author in the horror genre. The setting and characters are influenced by King\'s personal experiences, including both his visit to The Stanley Hotel in 1974 and his recovery from alcoholism. The novel was followed by a sequel, Doctor Sleep, published in 2013.',
  rating: 5,
  price: 59.99,
)
book2.image.attach(io: File.open("#{Rails.root}/app/assets/images/the_shining.jpg"), filename: "the_shining.jpg")
book2.save!

book3 = Book.new(
  title: 'Carrie',
  author: 'Stephen King',
  description: 'Carrie is an epistolary horror novel by American author Stephen King. It was his first published novel, released on April 5, 1974, with a first print-run of 30,000 copies. Set primarily in the then-future year of 1979, it revolves around the eponymous Carrie White, an unpopular friendless misfit and bullied high-school',  
  rating: 5,
  price: 69.99,
)
book3.image.attach(io: File.open("#{Rails.root}/app/assets/images/carrie.jpg"), filename: "carrie.jpg")
book3.save!

puts 'Livros de Stephen King criados com sucesso!'

# add books j.k. rowling
book4 = Book.new(
  title: 'Harry Potter and the Philosopher\'s Stone',
  author: 'J.K. Rowling',
  description: 'Harry Potter and the Philosopher\'s Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling\'s debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to Hogwarts School of Witchcraft and Wizardry.',
  rating: 5,
  price: 79.90,
)
book4.image.attach(io: File.open("#{Rails.root}/app/assets/images/harry_potter_1.jpg"), filename: "harry_potter_1.jpg")
book4.save!

book5 = Book.new(
  title: 'Harry Potter and the Chamber of Secrets',
  author: 'J.K. Rowling',
  description: 'Harry Potter and the Chamber of Secrets is a fantasy novel written by British author J. K. Rowling and the second novel in the Harry Potter series. The plot follows Harry\'s second year at Hogwarts School of Witchcraft and Wizardry, during which a series of messages on the walls of the school\'s corridors warn that the "Chamber of Secrets" has been opened and that the "heir of Slytherin" would kill all pupils who do not come from all-magical families.',
  rating: 5,
  price: 89.90,
)
book5.image.attach(io: File.open("#{Rails.root}/app/assets/images/harry_potter_2.jpg"), filename: "harry_potter_2.jpg")
book5.save!

book6 = Book.new(
  title: 'Harry Potter and the Prisoner of Azkaban',
  author: 'J.K. Rowling',
  description: 'Harry Potter and the Prisoner of Azkaban is a fantasy novel written by British author J. K. Rowling and is the third in the Harry Potter series. The book follows Harry Potter, a young wizard, in his third year at Hogwarts School of Witchcraft and Wizardry. Along with friends Ronald Weasley and Hermione Granger, Harry investigates Sirius Black, an escaped prisoner from Azkaban who they believe is one of Lord Voldemort\'s old allies.',
  rating: 5,
  price: 99.90,
)
book6.image.attach(io: File.open("#{Rails.root}/app/assets/images/harry_potter_3.jpg"), filename: "harry_potter_3.jpg")
book6.save!

puts 'Livros de J.K. Rowling criados com sucesso!'

# add comments
Comment.create!(content: 'Eu amo esse livro!', book: book1, user_id: 1)
Comment.create!(content: 'Livro muito interessante!', book: book2, user_id: 1)
Comment.create!(content: 'Recomendo a leitura!', book: book3, user_id: 1)
Comment.create!(content: 'Uma das melhores séries de livros que já li!', book: book4, user_id: 1)
Comment.create!(content: 'Muito bom!', book: book5, user_id: 1)
Comment.create!(content: 'Recomendo a leitura!', book: book6, user_id: 1)

puts 'Comentários criados com sucesso!'

puts 'Seed finalizado com sucesso!'
