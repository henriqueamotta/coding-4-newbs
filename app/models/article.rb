class Article < ApplicationRecord
  # require "open-uri"
  has_one_attached :photo

  belongs_to :term
  # after_save :set_content, if: -> { saved_change_to_name? }

  after_save if: -> { saved_change_to_name? } do
    set_content
    # set_photo
  end

  def content
    if super.blank?
      set_content
    else
      super
    end
  end

  private

  def set_content
    user = OpenAI::Client.new
    response = user.chat(parameters: {
      model: "gpt-4o",
      messages: [{
        role: "user",
        content: "Escreva um artigo, de forma clara, objetiva e simples o termo ou expressão de linguagem de programação, com duração de leitura média de 10 minutos, sem utilizar metáforas técnicas e se a palavra não tiver relação com linguagem de programação informe sem dar muitas explicações como se fosse um dicionário técnico. A explicação deve ser curta, mas suficiente para que alguém com conhecimento básico de programação entenda. Evite jargões complexos e, se necessário, inclua um exemplo prático e simples e não utilize códigos. Tema do artigo a ser escrito: #{name}"}]
    })

    new_content = response["choices"][0]["message"]["content"]

    update!(content: new_content)
    return new_content
  end

  # def set_photo
  #   client = OpenAI::Client.new
  #   response = client.images.generate(parameters: {
  #     prompt: "Imagem relacionada a #{name}. Dê preferência a imagens de código escrito, telas de computador, teclados, prompts. Sem mostrar partes humanas, sem inventar letras.", size: "256x256"
  #   })

  #   url = response["data"][0]["url"]
  #   file =  URI.parse(url).open

  #   photo.purge if photo.attached?
  #   photo.attach(io: file, filename: "ai_generated_image.jpg", content_type: "image/png")
  #   return photo
  # end
end
