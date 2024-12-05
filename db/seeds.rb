# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# 1. Clean the database:
puts "Cleaning database..."
Article.destroy_all
Term.destroy_all
User.destroy_all
puts "**********************"


# 2. Create admin user:
admin = User.create!(
  email: 'admin@admin.com',
  password: 'coding4newbs',
  admin: true
  )
puts admin.email
puts admin.password
puts "**********************"

# 3. Create user:
user = User.create!(
  email: 'user@user.com',
  password: '123123'
  )
puts user.email
puts user.password
puts "**********************"

Term.create!(name: "Hash")
Term.create!(name: "CRUD")
Term.create!(name: "DRY")

Article.create!(name: "Javascript", term_id: term_1.id)
Article.create!(name: "Rails", term_id: term_1.id)
Article.create!(name: "CSS", term_id: term_1.id)
Article.create!(name: "HTML", term_id: term_1.id)

# 4. Create the instances:
# term_1 = Term.new(
#   name: "CRUD",
#   description: "CRUD é um acrônimo que representa as quatro operações básicas de manipulação de dados em um banco de dados ou sistema de armazenamento de dados. As operações são: Create (criar), Read (ler), Update (atualizar), Delete (excluir)."
#   )
# term_1.save!

# term_2 = Term.new(
#   name: "Class",
#   description: "Uma classe é um modelo ou estrutura que define um tipo de objeto. Ela serve como um 'blueprint' (plano) para criar objetos, encapsulando dados e comportamentos relacionados. As classes são um dos principais conceitos da programação orientada a objetos (POO) e têm as seguintes características principais: atributos (ou propriedades), métodos, encapsulamento, herança, instanciação."
#   )
# term_2.save!

# article_1 = Article.new(
#   name: "Ruby",
#   content: "Ruby é uma linguagem de programação de alto nível, interpretada e orientada a objetos, conhecida por sua simplicidade e produtividade. Características particulares: sintaxe elegante, orientação a objetos, flexibilidade, foco na programação humana, entre outras. Em comparação com outras linguagens, Ruby se destaca pela sua abordagem centrada no desenvolvedor e pela facilidade de uso, embora possa ser menos eficiente em termos de desempenho em comparação com linguagens como C ou Java.",
#   term_id: term_1.id
#   )
# article_1.save!

# article_2 = Article.new(
#   name: "Java",
#   content: "Java é uma linguagem de programação de alto nível, orientada a objetos e amplamente utilizada, conhecida por sua portabilidade e robustez. Suas características particulares incluem: portabilidade, orientação a objetos, gerenciamento de memória, segurança, multithreading, entre outros. Em comparação com outras linguagens, Java é frequentemente elogiada por sua estabilidade e escalabilidade, mas pode ser considerada mais verbosa e menos flexível do que linguagens como Python ou Ruby.",
#   term_id: term_2.id
#   )
# article_2.save!

# article_3 = Article.new(
#   name: "Ruby on Rails",
#   content: "Simples e Poderoso, Ruby on Rails, muitas vezes referido simplesmente como Rails, é um dos frameworks de desenvolvimento web mais populares e influentes. Concebido por David Heinemeier Hansson e lançado em 2005, este framework open source baseado na linguagem de programação Ruby tem revolucionado a maneira como os desenvolvedores constroem aplicativos web.",
#   term_id: term_1.id
#   )
# article_3.save!

# article_4 = Article.new(
#   name: "DRY (Don't Repeat Yourself)",
#   content: "O princípio DRY é uma parte fundamental do Rails. Os desenvolvedores são incentivados a evitar a duplicação de código, o que contribui para um código mais limpo e uma manutenção mais fácil.",
#   term_id: term_2.id
#   )
# article_4.save!

# article_5 = Article.new(
#   name: "LINGUAGENS DE PROGRAMAÇÃO",
#   content: "Linguagens de programação são ferramentas criadas pelo ser humano para se comunicar com computadores. Elas permitem que escrevamos instruções que a máquina pode entender e executar. Cada linguagem tem suas próprias regras e sintaxe, mas todas compartilham o mesmo objetivo: facilitar a interação entre humanos e máquinas.",
#   term_id: term_2.id
#   )
# article_5.save!


# 5. Display a message:
puts "Finished! Created #{User.count} users."
puts "Finished! Created #{Term.count} terms."
puts "Finished! Created #{Article.count} articles."
