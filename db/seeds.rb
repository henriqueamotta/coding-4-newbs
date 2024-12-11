require "open-uri"

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

puts "Creating Terms database..."
term_1 = Term.create!(name: "Active Record")
term_2 = Term.create!(name: "Convention Over Configuration")
term_3 = Term.create!(name: "CRUD")
# term_4 = Term.create!(name: "DRY (Don't Repeat Yourself)")
# term_5 = Term.create!(name: "Gem")
# term_6 = Term.create!(name: "Hash")
# term_7 = Term.create!(name: "MVC (Model-View-Controller)")
# term_8 = Term.create!(name: "Routes")
# term_9 = Term.create!(name: "Ruby")
# term_10 = Term.create!(name: "Scaffold")
# term_11 = Term.create!(name: "Polymorphic Associations")
# term_12 = Term.create!(name: "Migration")
# term_13 = Term.create!(name: "Callback")
# term_14 = Term.create!(name: "Validation")
# term_15 = Term.create!(name: "Query Optimization")
# term_16 = Term.create!(name: "Render vs Redirect")
# term_17 = Term.create!(name: "Partial Views")
# term_18 = Term.create!(name: "RESTful APIs")
# term_19 = Term.create!(name: "Active Storage")
# term_20 = Term.create!(name: "Action Cable")

puts "Creating Articles database..."
article1 = Article.create!(name: "CRUD na prática", term_id: term_3.id)
article1_url = "https://www.brasilcode.com.br/wp-content/uploads/2023/04/CRUD.webp"
article1.photo.attach(io: URI.open(article1_url), filename: 'crud.png', content_type: 'image/png')

article2 = Article.create!(name: "Deploy de Aplicações Rails", term_id: term_1.id)
article2_url = "https://miro.medium.com/v2/resize:fit:828/format:webp/1*3MVVfER3VJv1bvhOkx5klA.png"
article2.photo.attach(io: URI.open(article2_url), filename: 'deploy_rails.png', content_type: 'image/png')

# article3 = Article.create!(name: "Gems úteis no Rails", term_id: term_5.id)
# article3_url = "https://lokalise.com/blog/wp-content/webp-express/webp-images/doc-root/wp-content/uploads/2020/10/Ruby2.png.webp"
# article3.photo.attach(io: URI.open(article3_url), filename: 'gems.png', content_type: 'image/png')

# article4 = Article.create!(name: "Introdução ao Rails", term_id: term_9.id)
# article4_url = "https://rubyonrails.org/assets/images/opengraph.png"
# article4.photo.attach(io: URI.open(article4_url), filename: 'rail.png', content_type: 'image/png')

# article5 = Article.create!(name: "MVC explicado", term_id: term_7.id)
# article5_url = "https://miro.medium.com/v2/resize:fit:1400/0*ZqwogJDz1cA1sr-B.png"
# article5.photo.attach(io: URI.open(article5_url), filename: 'mvc_explicado.png', content_type: 'image/png')

# article6 = Article.create!(name: "Trabalhando com Active Record", term_id: term_1.id)
# article6_url = "https://i.sstatic.net/KtUQF.png"
# article6.photo.attach(io: URI.open(article6_url), filename: 'active_record.png', content_type: 'image/png')

# article7 = Article.create!(name: "Como criar um Hash no Ruby", term_id: term_6.id)
# article7_url = "https://www.demorodavel.com/wp-content/uploads/2023/08/image-1-1024x708.png"
# article7.photo.attach(io: URI.open(article7_url), filename: 'hash_ruby.png', content_type: 'image/png')

# article8 = Article.create!(name: "Entendendo DRY em programação", term_id: term_4.id)
# article8_url = "https://ih1.redbubble.net/image.896939270.0211/st,small,507x507-pad,600x600,f8f8f8.jpg"
# article8.photo.attach(io: URI.open(article8_url), filename: 'dry_programming.jpg', content_type: 'image/jpeg')

# article9 = Article.create!(name: "Por que usar o Rails?", term_id: term_9.id)
# article9_url = "https://hermes.dio.me/articles/cover/68aa896c-0660-4a60-a1d4-c512ce8cf2ab.png"
# article9.photo.attach(io: URI.open(article9_url), filename: 'why_rails.png', content_type: 'image/png')

# article10 = Article.create!(name: "Como configurar rotas no Rails", term_id: term_8.id)
# article10_url = "https://camo.githubusercontent.com/c60846edfc55ec953818a1dc5be3d7daa0b46db52166c9bb119c13427ceaa100/687474703a2f2f692e696d6775722e636f6d2f70557a3877567a2e706e67"
# article10.photo.attach(io: URI.open(article10_url), filename: 'routes_rails.png', content_type: 'image/png')

# article11 = Article.create!(name: "Entendendo Polymorphic Associations", term_id: term_11.id)
# article11_url = "https://miro.medium.com/v2/resize:fit:1400/1*QpHpomd5Gqc9tEPaczBbCw.png"
# article11.photo.attach(io: URI.open(article11_url), filename: 'polymorphic.png', content_type: 'image/png')

# article12 = Article.create!(name: "Como criar e usar Migrations no Rails", term_id: term_12.id)
# article12_url = "https://external-preview.redd.it/P_HhZ-c6qn071slxEjGEOA70nscUil33uN_iLy7Ygxo.jpg?width=640&crop=smart&auto=webp&s=083a6856fbade1dad69d3d96be73e55db9599590"
# article12.photo.attach(io: URI.open(article12_url), filename: 'migration.png', content_type: 'image/jpeg')

# article13 = Article.create!(name: "Callbacks no Rails: Boas Práticas", term_id: term_13.id)
# article13_url = "https://miro.medium.com/v2/resize:fit:5848/1*MYZdjN8CPEiGmn-haE9coQ.png"
# article13.photo.attach(io: URI.open(article13_url), filename: 'callback.png', content_type: 'image/png')

# article14 = Article.create!(name: "Validações no Active Record", term_id: term_14.id)
# article14_url = "https://guides.rubyonrails.org/v3.2/images/error_messages.png"
# article14.photo.attach(io: URI.open(article14_url), filename: 'validation.png', content_type: 'image/png')

# article15 = Article.create!(name: "RESTful APIs no Rails", term_id: term_18.id)
# article15_url = "https://media2.dev.to/dynamic/image/width=1600,height=900,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fk0rltptwcybhsx7qb9oi.png"
# article15.photo.attach(io: URI.open(article15_url), filename: 'restful.png', content_type: 'image/png')

# 5. Display a message:
puts "Finished! Created #{User.count} users."
puts "Finished! Created #{Term.count} terms."
puts "Finished! Created #{Article.count} articles."
