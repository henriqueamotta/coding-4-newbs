class Term < ApplicationRecord
  has_many :article
  after_save :set_description, if: -> { saved_change_to_name? }

  validates :name, presence: true
  # validates :description, presence: true

  def description
    if super.blank?
      set_description
    else
      super
    end
  end

  private

  def set_description
    user = OpenAI::Client.new
    response = user.chat(parameters: {
      model: "gpt-4o",
      messages: [{
        role: "user",
        content: "Explique de forma clara, objetiva e simples o termo ou expressão de linguagem de programação, sem utilizar metáforas técnicas e se a palavra não tiver relação com linguagem de programação informe sem dar muitas explicações como se fosse um dicionário técnico. A explicação deve ser curta, mas suficiente para que alguém com conhecimento básico de programação entenda. Evite jargões complexos e, se necessário, inclua um exemplo prático e simples e não utilize códigos. Termo a ser explicado: #{name}"}]
    })

    new_description = response["choices"][0]["message"]["content"]

    update!(description: new_description)
    return new_description
  end

end
