require "open-uri"

puts "🧹 Limpando banco de dados..."
Article.destroy_all
Term.destroy_all
User.destroy_all
puts "**********************"

# 1. Criar Usuários
puts "👤 Criando Usuários..."
User.create!(email: 'admin@admin.com', password: 'coding4newbs', admin: true)
User.create!(email: 'user@user.com', password: '123123')
puts "✅ Usuários criados!"

puts "📚 Criando Conteúdo (Termos + Artigos)..."

# Definição dos dados para popular o banco
# Estrutura: Um Termo (Dicionário) tem vários Artigos (Tutoriais)
data = [
  {
    term_name: "Active Record",
    term_desc: "O Active Record é a camada do M (Model) no padrão MVC do Rails. Ele é responsável pela representação dos dados e lógica de negócios, além de realizar o mapeamento objeto-relacional (ORM), conectando classes Ruby a tabelas do banco de dados.",
    articles: [
      {
        title: "CRUD na prática com Rails",
        image_url: "https://www.brasilcode.com.br/wp-content/uploads/2023/04/CRUD.webp",
        filename: "crud.png",
        content: <<~MARKDOWN
          ## Introdução ao CRUD

          CRUD é o acrônimo para as quatro operações básicas em qualquer banco de dados relacional: **C**reate (Criar), **R**ead (Ler), **U**pdate (Atualizar) e **D**elete (Excluir). No Rails, o Active Record abstrai a complexidade do SQL, permitindo que utilizemos métodos Ruby intuitivos.

          ### 1. Create (Criação)
          Para salvar dados no banco, instanciamos o modelo e chamamos o método `.save`, ou usamos diretamente o `.create`.

          ```ruby
          # Método 1: Instanciar e Salvar
          usuario = User.new(nome: "DevMaster", email: "dev@exemplo.com")
          usuario.save

          # Método 2: Criar diretamente
          User.create(nome: "Henrique", email: "henrique@exemplo.com")
          ```

          ### 2. Read (Leitura)
          O Active Record oferece uma interface rica para consultas (queries).

          * `User.all`: Retorna todos os usuários.
          * `User.find(1)`: Busca o usuário com ID 1.
          * `User.find_by(email: "dev@exemplo.com")`: Busca pelo atributo.

          ### 3. Update (Atualização)
          Podemos buscar um registro, alterar seus atributos e salvar.

          ```ruby
          user = User.find(1)
          user.update(nome: "Novo Nome")
          ```

          ### 4. Delete (Exclusão)
          Para remover um registro do banco de dados:

          ```ruby
          user = User.find(1)
          user.destroy
          ```

          ### Conclusão
          Dominar o CRUD é o primeiro passo para se tornar um desenvolvedor Rails proficiente. O Active Record torna esse processo seguro (protegendo contra SQL Injection) e elegante.
        MARKDOWN
      },
      {
        title: "Validations: Garantindo a integridade dos dados",
        image_url: "https://guides.rubyonrails.org/v3.2/images/error_messages.png",
        filename: "validations.png",
        content: <<~MARKDOWN
          ## Por que validar?

          Validações são regras que protegem seu banco de dados de dados inválidos. No Rails, essas regras são definidas diretamente no Model.

          ### Principais Validações

          Aqui estão as mais comuns utilizadas no dia a dia:

          **Presence**
          Garante que o campo não esteja vazio.
          ```ruby
          validates :name, presence: true
          ```

          **Uniqueness**
          Garante que não existam dois registros iguais (ex: emails duplicados).
          ```ruby
          validates :email, uniqueness: true
          ```

          **Length**
          Define tamanhos mínimos ou máximos.
          ```ruby
          validates :password, length: { minimum: 6 }
          ```

          ### Exibindo erros
          Quando um objeto falha na validação, o Rails popula a coleção `errors`.

          ```ruby
          user = User.new(name: nil)
          user.save # => false
          user.errors.full_messages # => ["Name can't be blank"]
          ```
        MARKDOWN
      }
    ]
  },
  {
    term_name: "MVC (Model-View-Controller)",
    term_desc: "Padrão de arquitetura de software que separa a aplicação em três componentes principais: Model (dados), View (interface) e Controller (interação). O Rails segue este padrão estritamente.",
    articles: [
      {
        title: "MVC Explicado: O fluxo do Rails",
        image_url: "https://miro.medium.com/v2/resize:fit:1400/0*ZqwogJDz1cA1sr-B.png",
        filename: "mvc.png",
        content: <<~MARKDOWN
          ## Entendendo a Arquitetura

          Muitos iniciantes se perdem ao tentar entender onde colocar cada pedaço de código. Vamos desmistificar o fluxo de uma requisição web no Rails.

          ### 1. O Router (O Porteiro)
          Tudo começa no `config/routes.rb`. Quando o usuário acessa `/artigos`, o router decide para qual Controller enviar.

          ### 2. O Controller (O Gerente)
          O Controller recebe o pedido. Ele não tem os dados, nem a interface. Ele apenas coordena.

          ```ruby
          def index
            @articles = Article.all # Pede dados ao Model
          end # Automaticamente renderiza a View 'index'
          ```

          ### 3. O Model (O Especialista)
          O Model (`Article`) conversa com o banco de dados SQL e retorna objetos Ruby para o Controller.

          ### 4. A View (O Artista)
          A View pega os dados que o Controller preparou (nas variáveis de instância, como `@articles`) e gera o HTML final que o usuário vê.

          ### Resumo
          * **Model:** Lógica de negócio e Banco de Dados.
          * **View:** HTML, CSS e o que o usuário vê.
          * **Controller:** Cola tudo junto e responde às ações do usuário.
        MARKDOWN
      }
    ]
  },
  {
    term_name: "Gems",
    term_desc: "Gems são pacotes de código Ruby (bibliotecas) que resolvem problemas específicos. O gerenciador de pacotes RubyGems permite instalar, gerenciar e distribuir essas bibliotecas.",
    articles: [
      {
        title: "Gems essenciais para todo projeto Rails",
        image_url: "https://lokalise.com/blog/wp-content/webp-express/webp-images/doc-root/wp-content/uploads/2020/10/Ruby2.png.webp",
        filename: "gems.png",
        content: <<~MARKDOWN
          ## Não reinvente a roda

          Uma das maiores forças do Ruby on Rails é seu ecossistema. Aqui estão gems que você provavelmente usará:

          ### Devise
          A solução padrão para autenticação. Login, registro, recuperação de senha, tudo pronto.
          ```ruby
          gem 'devise'
          ```

          ### Pundit
          Para controle de acesso (Autorização). Define quem pode fazer o que.

          ### Simple Form
          Facilita drasticamente a criação de formulários HTML com integração automática ao Bootstrap.

          ### RSpec & FactoryBot
          A dupla dinâmica para testes automatizados. Substitui o Minitest padrão para uma sintaxe mais legível.

          ### Rubocop
          Garante que seu código siga os padrões de estilo da comunidade Ruby. Essencial para trabalhar em equipe.
        MARKDOWN
      }
    ]
  }
]

# Loop de Criação
data.each do |item|
  # Cria o Termo
  term = Term.create!(
    name: item[:term_name],
    description: item[:term_desc]
  )
  puts "   Termo criado: #{term.name}"

  # Cria os Artigos do Termo
  item[:articles].each do |art|
    article = Article.create!(
      name: art[:title],
      content: art[:content],
      term: term
    )

    # Anexa a imagem
    file = URI.open(art[:image_url])
    article.photo.attach(io: file, filename: art[:filename], content_type: 'image/png')

    puts "      Artigo criado: #{article.name}"
  end
end

puts "**********************"
puts "🚀 Finalizado! Banco de dados pronto."
