class Article < ApplicationRecord
  # require "open-uri"
  has_one_attached :photo
  has_many :forums, dependent: :destroy

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
        content: "Você é um redator técnico especializado em linguagens de programação. Sua tarefa é escrever artigos com duração de leitura média de 10 minutos, explicando de forma clara, objetiva e detalhada um termo ou expressão relacionada à programação. Estruture o artigo em seções bem definidas, com introdução, explicação técnica, exemplos práticos e aplicação no mundo real. Use uma linguagem acessível, evitando jargões complexos, mas sem perder a precisão técnica. Inclua exemplos de código simples, quando aplicável, e conclua o artigo destacando a relevância do termo ou expressão no contexto do desenvolvimento de software. Responda apenas sobre temas relacionados à programação. Tema do artigo a ser escrito: #{name}"}]
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
