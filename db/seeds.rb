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

term_1 = Term.create!(name: "Active_Record")
Term.create!(name: "Convention Over Configuration")
Term.create!(name: "CRUD")
Term.create!(name: "DRY")
Term.create!(name: "Gem")
Term.create!(name: "Hash")
Term.create!(name: "MVC")
Term.create!(name: "Routes")
Term.create!(name: "Ruby")
Term.create!(name: "Scaffold")

Article.create!(name: "CRUD na prática", term_id: term_1.id)
Article.create!(name: "Deploy de Aplicações Rails", term_id: term_1.id)
Article.create!(name: "Gems úteis no Rails", term_id: term_1.id)
Article.create!(name: "Introdução ao Rails", term_id: term_1.id)
Article.create!(name: "MVC explicado", term_id: term_1.id)
Article.create!(name: "O que é um Hash?", term_id: term_1.id)
Article.create!(name: "Por que usar o Rails?", term_id: term_1.id)
Article.create!(name: "Rails e Ruby: uma parceria poderosa", term_id: term_1.id)
Article.create!(name: "Testes no Rails", term_id: term_1.id)
Article.create!(name: "Trabalhando com Active Record", term_id: term_1.id)

# Term: MVC
# Description: "MVC (Model-View-Controller) é um padrão de design arquitetural que separa a aplicação em três componentes principais: Model (modelo), View (visão) e Controller (controlador)."

# Term: Active Record
# Description: "Active Record é o ORM (Object Relational Mapping) integrado ao Rails que facilita a manipulação de bancos de dados relacionais, permitindo que desenvolvedores trabalhem diretamente com objetos Ruby para realizar operações CRUD."

# Term: Routes
# Description: "No Rails, routes são responsáveis por mapear URLs para ações específicas em controllers. Elas são definidas no arquivo config/routes.rb."

# Term: Gem
# Description: "Gem é o nome dado aos pacotes de bibliotecas Ruby que podem ser facilmente integrados em projetos Rails para adicionar funcionalidades ou extensões."

# Term: Scaffold
# Description: "O Scaffold é uma funcionalidade do Rails que gera rapidamente um conjunto completo de modelos, views e controllers para facilitar o desenvolvimento inicial."

# Term: DRY
# Description: "O princípio DRY (Don't Repeat Yourself) é uma prática fundamental do Rails que incentiva evitar a duplicação de código, resultando em maior manutenibilidade."

# Term: CRUD
# Description: "CRUD é um acrônimo que representa as quatro operações básicas de manipulação de dados em um banco de dados: Create, Read, Update e Delete."

# Term: Hash
# Description: "No Ruby, Hash é uma estrutura de dados que armazena pares de chave-valor, permitindo acesso rápido e eficiente aos dados."

# Term: Convention Over Configuration
# Description: "Este princípio do Rails promove o uso de convenções padrão para reduzir a necessidade de configuração manual, acelerando o desenvolvimento."

# Term: Ruby
# Description: "Ruby é uma linguagem de programação de alto nível conhecida por sua simplicidade, flexibilidade e foco na produtividade do desenvolvedor."

# --------------------------- #

# Article: Introdução ao Rails
# Content: "Rails é um framework de desenvolvimento web construído sobre Ruby, focado em convenções ao invés de configurações (convention over configuration). Ele simplifica o desenvolvimento de aplicações ao seguir boas práticas e ao integrar ferramentas como Active Record, Action Pack e Active Support."
# Term: MVC

# Article: Por que usar o Rails?
# Content: "O Rails é uma escolha popular para startups e projetos ágeis devido à sua alta produtividade, grande comunidade de desenvolvedores, convenções consistentes e suporte a testes automáticos. É usado por empresas como Shopify, GitHub e Airbnb."
# Term: Convention Over Configuration

# Article: Trabalhando com Active Record
# Content: "Active Record permite que você interaja com o banco de dados utilizando objetos Ruby. Ele traduz consultas SQL em métodos Ruby, facilitando tarefas como buscas, inserções e associações entre tabelas."
# Term: Active Record

# Article: Testes no Rails
# Content: "O Rails oferece suporte integrado a testes unitários, funcionais e de integração por meio do framework Minitest, garantindo que sua aplicação esteja robusta e livre de erros."
# Term: DRY

# Article: Deploy de Aplicações Rails
# Content: "O deploy de aplicações Rails pode ser feito em plataformas como Heroku, AWS ou serviços especializados como Hatchbox. Com ferramentas como Capistrano, é possível automatizar o processo e manter um fluxo de entrega contínua."
# Term: Scaffold

# Article: Gems úteis no Rails
# Content: "Gems como Devise, Pundit e RSpec adicionam funcionalidades importantes a projetos Rails, desde autenticação até autorização e testes."
# Term: Gem

# Article: O que é um Hash?
# Content: "No Ruby, Hash é uma estrutura para armazenar pares de chave-valor, sendo uma das estruturas mais usadas devido à sua eficiência e flexibilidade."
# Term: Hash

# Article: MVC explicado
# Content: "O padrão MVC separa lógica de negócio, interface de usuário e controle de fluxo, tornando aplicações mais organizadas e fáceis de manter."
# Term: MVC

# Article: CRUD na prática
# Content: "CRUD representa as operações básicas de manipulação de dados em sistemas, essenciais em qualquer aplicação web."
# Term: CRUD

# Article: Rails e Ruby: uma parceria poderosa
# Content: "Rails utiliza Ruby para oferecer uma abordagem centrada no desenvolvedor, simplificando tarefas complexas e acelerando o desenvolvimento."
# Term: Ruby

# Article.create!(name: "Javascript", term_id: term_1.id)
# Article.create!(name: "Rails", term_id: term_1.id)
# Article.create!(name: "CSS", term_id: term_1.id)
# Article.create!(name: "HTML", term_id: term_1.id)









# 5. Display a message:
puts "Finished! Created #{User.count} users."
puts "Finished! Created #{Term.count} terms."
puts "Finished! Created #{Article.count} articles."
