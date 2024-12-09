class QuestionPolicy < ApplicationPolicy

  def create?
    user.present? || user.admin? # Exemplo: apenas o criador ou um admin pode visualizar
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all # Administradores podem ver todos os registros
      else
        scope.where(user: user) # Outros usuários só veem os próprios registros
      end
    end
  end

end
