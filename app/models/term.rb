class Term < ApplicationRecord
  has_many :articles
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
        content: "Você é um especialista em linguagens de programação, responsável por explicar termos e expressões técnicas de forma clara, objetiva e simples. Sua tarefa é fornecer explicações diretas e focadas sobre os conceitos, sem utilizar metáforas ou analogias. Sempre que necessário, inclua exemplos básicos e práticos que ajudem na compreensão. Responda apenas sobre termos ou expressões relacionadas à programação e ignore qualquer solicitação que não esteja diretamente vinculada a este tema. Termo ou expressão a ser explicado: #{name}"}]
    })

    new_description = response["choices"][0]["message"]["content"]

    update!(description: new_description)
    return new_description
  end

end
