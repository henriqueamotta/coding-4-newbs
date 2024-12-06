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

# 5. Display a message:
puts "Finished! Created #{User.count} users."
puts "Finished! Created #{Term.count} terms."
puts "Finished! Created #{Article.count} articles."
