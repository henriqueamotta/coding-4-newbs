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

article1 = Article.create!(name: "CRUD na prática", term_id: term_1.id)
article1_url = "https://www.brasilcode.com.br/wp-content/uploads/2023/04/CRUD.webp"
article1.photo.attach(io: URI.open(article1_url), filename: 'crud.png', content_type: 'image/png')

article2 = Article.create!(name: "Deploy de Aplicações Rails", term_id: term_1.id)
article2_url = "https://miro.medium.com/v2/resize:fit:828/format:webp/1*3MVVfER3VJv1bvhOkx5klA.png"
article2.photo.attach(io: URI.open(article2_url), filename: 'deploy_rails.png', content_type: 'image/png')

article3 = Article.create!(name: "Gems úteis no Rails", term_id: term_1.id)
article3_url = "https://lokalise.com/blog/wp-content/webp-express/webp-images/doc-root/wp-content/uploads/2020/10/Ruby2.png.webp"
article3.photo.attach(io: URI.open(article3_url), filename: 'gems.png', content_type: 'image/png')

article4 = Article.create!(name: "Introdução ao Rails", term_id: term_1.id)
article4_url = "https://rubyonrails.org/assets/images/opengraph.png"
article4.photo.attach(io: URI.open(article4_url), filename: 'rail.png', content_type: 'image/png')



# Article.create!(name: "MVC explicado", term_id: term_1.id)
# Article.create!(name: "O que é um Hash?", term_id: term_1.id)
# Article.create!(name: "Por que usar o Rails?", term_id: term_1.id)
# Article.create!(name: "Rails e Ruby: uma parceria poderosa", term_id: term_1.id)
# Article.create!(name: "Testes no Rails", term_id: term_1.id)
# Article.create!(name: "Trabalhando com Active Record", term_id: term_1.id)

# 5. Display a message:
puts "Finished! Created #{User.count} users."
puts "Finished! Created #{Term.count} terms."
puts "Finished! Created #{Article.count} articles."
