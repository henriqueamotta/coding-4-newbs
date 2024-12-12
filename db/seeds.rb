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
term_1 = Term.create!(name: "Active Admin")
term_2 = Term.create!(name: "Active Job")
term_3 = Term.create!(name: "Active Model")
term_4 = Term.create!(name: "Active Record")
term_5 = Term.create!(name: "Active Storage")
term_6 = Term.create!(name: "Active Support")
term_7 = Term.create!(name: "ActiveSupport Concerns")
term_8 = Term.create!(name: "ActiveRecord Callbacks")
term_9 = Term.create!(name: "Action Cable")
term_10 = Term.create!(name: "Action Mailbox")
# term_11 = Term.create!(name: "Action Mailer")
# term_12 = Term.create!(name: "Action Pack")
# term_13 = Term.create!(name: "Action Policy")
# term_14 = Term.create!(name: "Action Text")
# term_15 = Term.create!(name: "Action View")
# term_16 = Term.create!(name: "API Rate Limiting")
# term_17 = Term.create!(name: "API Versioning")
# term_18 = Term.create!(name: "Apollo Client")
# term_19 = Term.create!(name: "Asset Pipeline")
# term_20 = Term.create!(name: "Background Jobs")
# term_21 = Term.create!(name: "Bundler")
# term_22 = Term.create!(name: "Caching")
# term_23 = Term.create!(name: "Callback")
# term_24 = Term.create!(name: "Capybara")
# term_25 = Term.create!(name: "Cancancan")
# term_26 = Term.create!(name: "Code Refactoring")
# term_27 = Term.create!(name: "Command Query Responsibility Segregation (CQRS)")
# term_28 = Term.create!(name: "Convention Over Configuration")
# term_29 = Term.create!(name: "Cookies")
# term_30 = Term.create!(name: "Cross-Origin Resource Sharing (CORS)")
# term_31 = Term.create!(name: "Cross-Site Request Forgery (CSRF)")
# term_32 = Term.create!(name: "CRUD")
# term_33 = Term.create!(name: "Custom Validations")
# term_34 = Term.create!(name: "Database Indexing")
# term_35 = Term.create!(name: "Database Seeding")
# term_36 = Term.create!(name: "Database Transactions")
# term_37 = Term.create!(name: "Decorator Pattern")
# term_38 = Term.create!(name: "Devise")
# term_39 = Term.create!(name: "DRb (Distributed Ruby)")
# term_40 = Term.create!(name: "DRY (Don't Repeat Yourself)")
# term_41 = Term.create!(name: "Eager Loading")
# term_42 = Term.create!(name: "Enumerable")
# term_43 = Term.create!(name: "Environment Variables")
# term_44 = Term.create!(name: "ERB Templates")
# term_45 = Term.create!(name: "Error Handling")
# term_46 = Term.create!(name: "Event-Driven Architecture")
# term_47 = Term.create!(name: "Factory Bot")
# term_48 = Term.create!(name: "Factory Pattern")
# term_49 = Term.create!(name: "Form Helpers")
# term_50 = Term.create!(name: "Full-text Search")
# term_51 = Term.create!(name: "Gem")
# term_52 = Term.create!(name: "GraphQL")
# term_53 = Term.create!(name: "HAML")
# term_54 = Term.create!(name: "Hash")
# term_55 = Term.create!(name: "Helpers")
# term_56 = Term.create!(name: "Internationalization (I18n)")
# term_57 = Term.create!(name: "JSON API")
# term_58 = Term.create!(name: "Lazy Loading")
# term_59 = Term.create!(name: "Localization (L10n)")
# term_60 = Term.create!(name: "Logger")
# term_61 = Term.create!(name: "Mailers")
# term_62 = Term.create!(name: "Memcached")
# term_63 = Term.create!(name: "Metaprogramming")
# term_64 = Term.create!(name: "Migration")
# term_65 = Term.create!(name: "Monkey Patching")
# term_66 = Term.create!(name: "MVC (Model-View-Controller)")
# term_67 = Term.create!(name: "Nested Forms")
# term_68 = Term.create!(name: "Observers")
# term_69 = Term.create!(name: "Omniauth")
# term_70 = Term.create!(name: "Pagination")
# term_71 = Term.create!(name: "Partial Views")
# term_72 = Term.create!(name: "Performance Optimization")
# term_73 = Term.create!(name: "Polymorphic Associations")
# term_74 = Term.create!(name: "Pundit")
# term_75 = Term.create!(name: "Query Optimization")
# term_76 = Term.create!(name: "Rails Engines")
# term_77 = Term.create!(name: "Rake Tasks")
# term_78 = Term.create!(name: "Redis")
# term_79 = Term.create!(name: "Render vs Redirect")
# term_80 = Term.create!(name: "RESTful APIs")
# term_81 = Term.create!(name: "Routes")
# term_82 = Term.create!(name: "RSpec")
# term_83 = Term.create!(name: "RSpec Matchers")
# term_84 = Term.create!(name: "Ruby")
# term_85 = Term.create!(name: "RubyGems")
# term_86 = Term.create!(name: "Scaffold")
# term_87 = Term.create!(name: "Scopes")
# term_88 = Term.create!(name: "Security Best Practices")
# term_89 = Term.create!(name: "Serializers")
# term_90 = Term.create!(name: "Service Objects")
# term_91 = Term.create!(name: "Session Management")
# term_92 = Term.create!(name: "Sidekiq")
# term_93 = Term.create!(name: "Single Table Inheritance")
# term_94 = Term.create!(name: "Strong Parameters")
# term_95 = Term.create!(name: "Testing")
# term_96 = Term.create!(name: "Thread Safety")
# term_97 = Term.create!(name: "Validation")
# term_98 = Term.create!(name: "Websockets")
# term_99 = Term.create!(name: "YAML")


puts "Creating Articles database..."
article1 = Article.create!(name: "CRUD na prática", term_id: term_3.id)
article1_url = "https://www.brasilcode.com.br/wp-content/uploads/2023/04/CRUD.webp"
article1.photo.attach(io: URI.open(article1_url), filename: 'crud.png', content_type: 'image/png')

# article2 = Article.create!(name: "Deploy de Aplicações Rails", term_id: term_66.id)
# article2_url = "https://miro.medium.com/v2/resize:fit:828/format:webp/1*3MVVfER3VJv1bvhOkx5klA.png"
# article2.photo.attach(io: URI.open(article2_url), filename: 'deploy_rails.png', content_type: 'image/png')

article3 = Article.create!(name: "Gems úteis no Rails", term_id: term_5.id)
article3_url = "https://lokalise.com/blog/wp-content/webp-express/webp-images/doc-root/wp-content/uploads/2020/10/Ruby2.png.webp"
article3.photo.attach(io: URI.open(article3_url), filename: 'gems.png', content_type: 'image/png')

article4 = Article.create!(name: "Introdução ao Rails", term_id: term_9.id)
article4_url = "https://rubyonrails.org/assets/images/opengraph.png"
article4.photo.attach(io: URI.open(article4_url), filename: 'rail.png', content_type: 'image/png')

article5 = Article.create!(name: "MVC explicado", term_id: term_7.id)
article5_url = "https://miro.medium.com/v2/resize:fit:1400/0*ZqwogJDz1cA1sr-B.png"
article5.photo.attach(io: URI.open(article5_url), filename: 'mvc_explicado.png', content_type: 'image/png')

article6 = Article.create!(name: "Trabalhando com Active Record", term_id: term_1.id)
article6_url = "https://i.sstatic.net/KtUQF.png"
article6.photo.attach(io: URI.open(article6_url), filename: 'active_record.png', content_type: 'image/png')

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

# article16 = Article.create!(name: "Como usar Scopes no Rails", term_id: term_21.id)
# article16_url = "https://railsexamples.com/assets/images/scope.jpeg"
# article16.photo.attach(io:URI.open(article16_url), filename: 'scopes.png', content_type: 'image/png')

# article17 = Article.create!(name: "Criando Helpers reutilizáveis", term_id: term_22.id)
# article17_url = "https://blog.appsignal.com/images/blog/2023-01/view-helpers.png"
# article17.photo.attach(io:URI.open(article17_url), filename: 'helpers.png', content_type: 'image/png')

# article18 = Article.create!(name: "Diferença entre Eager e Lazy Loading", term_id: term_23.id)
# article18_url = "https://i.ytimg.com/vi/6oMg8RaMuAo/maxresdefault.jpg"
# article18.photo.attach(io:URI.open(article18_url), filename: 'eager.png', content_type: 'image/png')

# article19 = Article.create!(name: "Gerenciando erros no Rails", term_id: term_25.id)
# article19_url = "https://i.sstatic.net/gkqrU.png"
# article19.photo.attach(io:URI.open(article19_url), filename: 'erros.png', content_type: 'image/png')

# article20 = Article.create!(name: "Gerenciamento de sessões no Rails", term_id: term_26.id)
# article20_url = "https://kinsta.com/pt/wp-content/uploads/sites/3/2022/07/ruby-on-rails-vs-node-js-360x180.png"
# article20.photo.attach(io:URI.open(article20_url), filename: 'sessoes.png', content_type: 'image/png')

# article21 = Article.create!(name: "Entendendo Cookies no Rails", term_id: term_27.id)
# article21_url = "https://media2.dev.to/dynamic/image/width=1000,height=500,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2F20vhhqgepa97qvdoy7ci.png"
# article21.photo.attach(io:URI.open(article21_url), filename: 'cookies.png', content_type: 'image/png')

# article22 = Article.create!(name: "Configurando Asset Pipeline", term_id: term_28.id)
# article22_url = "https://backend-development.github.io/images/asset-pipeline.svg"
# article22.photo.attach(io:URI.open(article22_url), filename: 'asset.png', content_type: 'image/png')

# article23 = Article.create!(name: "O que é Bundler e como usá-lo", term_id: term_29.id)
# article23_url = "https://miro.medium.com/v2/resize:fit:1120/0*FS2tzZkRPNJgm7MJ.png"
# article23.photo.attach(io:URI.open(article23_url), filename: 'bundler.png', content_type: 'image/png')

# article24 = Article.create!(name: "Como usar o Logger no Rails", term_id: term_30.id)
# article24_url = "https://i.sstatic.net/XVU4R.png"
# article24.photo.attach(io:URI.open(article24_url), filename: 'logger.png', content_type: 'image/png')

# article25 = Article.create!(name: "Introdução ao ERB Templates", term_id: term_31.id)
# article25_url = "https://hackernoon.imgix.net/images/ho3s3ylr.jpg"
# article25.photo.attach(io:URI.open(article25_url), filename: 'erb.png', content_type: 'image/png')

# article26 = Article.create!(name: "HAML vs ERB", term_id: term_32.id)
# article26_url = "https://i.sstatic.net/9Fy8E.png"
# article26.photo.attach(io:URI.open(article26_url), filename: 'haml.png', content_type: 'image/png')

# article27 = Article.create!(name: "O que é YAML?", term_id: term_33.id)
# article27_url = "https://www.raulmelo.me/_vercel/image?url=https%3A%2F%2Fcdn.sanity.io%2Fimages%2Fgc3hakk3%2Fproduction%2F9a3c16d182e97c6b7db6c0b99acf6290352d3287-2684x1106.png%3Frect%3D0%2C1%2C2684%2C1105%26w%3D1300%26h%3D535%26auto%3Dformat&w=1280&q=100"
# article27.photo.attach(io:URI.open(article27_url), filename: 'yaml.png', content_type: 'image/png')

# article28 = Article.create!(name: "Gerenciando Variáveis de Ambiente", term_id: term_34.id)
# article28_url = "https://kinsta.com/pt/wp-content/uploads/sites/3/2022/07/what-is-an-environment-variable-1024x512.jpg"
# article28.photo.attach(io:URI.open(article28_url), filename: 'variaveis.png', content_type: 'image/png')

# article29 = Article.create!(name: "Automatizando tarefas com Rake", term_id: term_35.id)
# article29_url = "https://www.bcompany.com.br/wp-content/uploads/2020/06/automatizar-as-tarefas-repetitivas-dp-e1591295800106.jpg"
# article29.photo.attach(io:URI.open(article29_url), filename: 'rake.png', content_type: 'image/png')

# article30 = Article.create!(name: "Trabalhando com Active Job", term_id: term_36.id)
# article30_url = "https://miro.medium.com/v2/resize:fit:1334/0*R3ubhCBNWa9M8Lnf"
# article30.photo.attach(io:URI.open(article30_url), filename: 'activejob.png', content_type: 'image/png')

# article31 = Article.create!(name: "Action Mailer na prática", term_id: term_37.id)
# article31_url = "https://blog.mystrika.com/wp-content/uploads/sites/8/2023/10/Action_Mailer_in_Ruby_on_Rails_photo_poster-3.jpg"
# article31.photo.attach(io:URI.open(article31_url), filename: 'actionmailer.png', content_type: 'image/png')

# article32 = Article.create!(name: "Dicas para usar Form Helpers", term_id: term_38.id)
# article32_url = "https://miro.medium.com/v2/resize:fit:1400/1*Y1uZiqrGcniamWP4uEaf_g.png"
# article32.photo.attach(io:URI.open(article32_url), filename: 'formhelpers.png', content_type: 'image/png')

# article33 = Article.create!(name: "Como criar Nested Forms", term_id: term_39.id)
# article33_url = "https://i.sstatic.net/MRoU2.jpg"
# article33.photo.attach(io:URI.open(article33_url), filename: 'nestedforms.png', content_type: 'image/png')

# article34 = Article.create!(name: "Entendendo Strong Parameters", term_id: term_40.id)
# article34_url = "https://miro.medium.com/v2/resize:fit:1024/1*gqSbX88tMnjDz_kDZaerMQ.png"
# article34.photo.attach(io:URI.open(article34_url), filename: 'strong.png', content_type: 'image/png')

# article35 = Article.create!(name: "Introdução a Service Objects", term_id: term_41.id)
# article35_url = "https://www.researchgate.net/profile/Vassilis-Kostakos/publication/224190730/figure/fig2/AS:393665110396942@1470868484881/Service-Object-Structure-Overview.png"
# article35.photo.attach(io:URI.open(article35_url), filename: 'service.png', content_type: 'image/png')

# article36 = Article.create!(name: "Usando Observers no Rails", term_id: term_42.id)
# article36_url = "https://kig.re/assets/images/posts/ruby/rails-models.png"
# article36.photo.attach(io:URI.open(article36_url), filename: 'observers.png', content_type: 'image/png')

# article37 = Article.create!(name: "Como criar Mailers no Rails", term_id: term_43.id)
# article37_url = "https://www.louisramos.dev/images/blogs/rails_mailer.png"
# article37.photo.attach(io:URI.open(article37_url), filename: 'mailers.png', content_type: 'image/png')

# article38 = Article.create!(name: "Criando Validations Customizadas", term_id: term_44.id)
# article38_url = "https://cdn.corporatefinanceinstitute.com/assets/data-validation.jpeg"
# article38.photo.attach(io:URI.open(article38_url), filename: 'validations.png', content_type: 'image/png')

# article39 = Article.create!(name: "Introdução a Serializers", term_id: term_45.id)
# article39_url = "https://sourcery.blog/wp-content/uploads/2023/01/drf-serializers-thumb-1.jpg"
# article39.photo.attach(io:URI.open(article39_url), filename: 'serializers.png', content_type: 'image/png')

# article40 = Article.create!(name: "Trabalhando com JSON API", term_id: term_46.id)
# article40_url = "https://blog.fibasile.com/content/images/2019/02/json-api.png"
# article40.photo.attach(io:URI.open(article40_url), filename: 'jsonapi.png', content_type: 'image/png')

# article41 = Article.create!(name: "O que é Active Model?", term_id: term_47.id)
# article41_url = "https://kinsta.com/jp/wp-content/uploads/sites/6/2023/12/active-record-query-optimization-tips.jpg"
# article41.photo.attach(io:URI.open(article41_url), filename: 'activemodel.png', content_type: 'image/png')

# article42 = Article.create!(name: "Como fazer Code Refactoring", term_id: term_48.id)
# article42_url = "https://images.prismic.io/superpupertest/9e6d4011-e254-4e86-ac75-e1001af52715_Frame+2653.png?auto=compress,format&dpr=3"
# article42.photo.attach(io:URI.open(article42_url), filename: 'refactoring.png', content_type: 'image/png')

# article43 = Article.create!(name: "Customizando Validations no Rails", term_id: term_44.id)
# article43_url = "https://railsdesigner.com/images/posts/form-validation-turbo-frame.jpg"
# article43.photo.attach(io: URI.open(article43_url), filename: 'validations.png', content_type: 'image/png')

# article44 = Article.create!(name: "Introdução a Serializers no Rails", term_id: term_45.id)
# article44_url = "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*TOFyM6hDi7C3WqY_jeHNDA.png"
# article44.photo.attach(io: URI.open(article44_url), filename: 'serializers.png', content_type: 'image/png')

# article45 = Article.create!(name: "Utilizando JSON API no Rails", term_id: term_46.id)
# article45_url = "https://miro.medium.com/v2/resize:fit:2628/format:webp/1*YZ5M_FjF8QNdtPGn4eMEgA.png"
# article45.photo.attach(io: URI.open(article45_url), filename: 'jsonapi.png', content_type: 'image/png')

# article46 = Article.create!(name: "Explorando o Active Model", term_id: term_47.id)
# article46_url = "https://miro.medium.com/v2/resize:fit:1400/format:webp/0*X-VG6RP4EvFJQYtl.jpg"
# article46.photo.attach(io: URI.open(article46_url), filename: 'activemodel.png', content_type: 'image/png')

# article47 = Article.create!(name: "Testando Aplicações Rails", term_id: term_49.id)
# article47_url = "https://i.postimg.cc/zD0TjCRc/Ruby.png"
# article47.photo.attach(io: URI.open(article47_url), filename: 'testing.png', content_type: 'image/png')

# article48 = Article.create!(name: "Introdução ao RSpec", term_id: term_50.id)
# article48_url = "https://www.brainstobytes.com/content/images/2020/03/download-2.png"
# article48.photo.attach(io: URI.open(article48_url), filename: 'rspec.png', content_type: 'image/png')

# article49 = Article.create!(name: "Automatizando Testes com Capybara", term_id: term_52.id)
# article49_url = "https://media.licdn.com/dms/image/v2/C4D12AQGE_fJPNf47sg/article-cover_image-shrink_423_752/article-cover_image-shrink_423_752/0/1520126180747?e=1739404800&v=beta&t=-avjh4ZQ37QTHk9mYm9tCBiAjgvBUVInbUmTe1muPBs"
# article49.photo.attach(io: URI.open(article49_url), filename: 'capybara.png', content_type: 'image/png')

# article50 = Article.create!(name: "Guia de boas práticas na programação", term_id: term_48.id)
# article50_url = "https://www.superti360.com.br/wp-content/uploads/2022/02/0-destaque-linguagens-de-programacao-2019.jpg"
# article50.photo.attach(io: URI.open(article50_url), filename: 'praticas.png', content_type: 'image/png')


# 5. Display a message:
puts "Finished! Created #{User.count} users."
puts "Finished! Created #{Term.count} terms."
puts "Finished! Created #{Article.count} articles."
