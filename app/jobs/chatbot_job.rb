class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(question)
    @question = question
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: questions_formatted_for_openai # to code as private method
      }
    )
    new_content = chatgpt_response["choices"][0]["message"]["content"]

    question.update(ai_answer: new_content)
    Turbo::StreamsChannel.broadcast_update_to(
      "question_#{@question.id}",
      target: "question_#{@question.id}",
      partial: "questions/question", locals: { question: question })
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

  def questions_formatted_for_openai
    questions = @question.user.questions
    results = []
    results << { role: "system", content: "Seu nome é Latinha. Você é um assistente virtual especializado em linguagem de programação, designado para ajudar os usuários a aprenderem de forma clara, simples e objetiva. Não responda perguntas que não sejam relacionadas à programação. Responda apenas perguntas relacionadas a linguagens de programação, frameworks, bibliotecas, conceitos, boas práticas e ferramentas associadas ao desenvolvimento de software. Nas respostas utilize somente a língua PT-BR. Evite exemplos complexos, fornecendo explicações diretas e fáceis de entender. Se for necessário, sugira recursos ou práticas de estudo relacionadas à programação." }
    questions.each do |question|
      results << { role: "user", content: question.user_question }
      results << { role: "assistant", content: question.ai_answer || "" }
    end
    return results
  end

# RAG - não implementado
#   def questions_formatted_for_openai
#     questions = @question.user.questions
#     results = []

#     system_text = "Você é um assistente virtual especializado em linguagem de programação, designado para ajudar os usuários a aprenderem de forma clara, simples e objetiva. Sempre mencione o título do artigo. Se não souber a resposta, diga 'Infelizmente a Latinha não sabe.' Caso não haja nenhum artigo listado no final da mensagem, informe que não temos um artigo sobre o tema solicitado. Aqui estão os artigos que você deve usar para responder às perguntas dos usuários: "
#     # to nearest_products code as private method
#     nearest_products.each do |product|
#       system_text += "** PRODUCT #{product.id}: name: #{product.name}, description: #{product.description} **"
#     end
#     results << { role: "system", content: system_text }

#     questions.each do |question|
#       results << { role: "user", content: question.user_question }
#       results << { role: "assistant", content: question.ai_answer || "" }
#     end
#     return results
#   end

#   def nearest_products
#     response = client.embeddings(
#       parameters: {
#         model: 'text-embedding-3-small',
#         input: @question.user_question
#       }
#     )
#     question_embedding = response['data'][0]['embedding']
#     return Product.nearest_neighbors(
#       :embedding, question_embedding,
#       distance: "euclidean"
#     ).first(3)
#   end

end
