class ArticlePolicy < ApplicationPolicy

  def index?
    true # Qualquer usuário pode listar os artigos
  end

  def show?
    true # Qualquer usuário pode visualizar os artigos
  end

  def create?
    user.present? && user.admin? # Apenas administradores logados podem criar
  end

  def update?
    user.present? && user.admin? # Apenas administradores logados podem editar
  end

  def destroy?
    user.present? && user.admin? # Apenas administradores logados podem excluir
  end

  class Scope < Scope
    def resolve
      scope.all # Retorna todos os artigos visíveis para o usuário
    end
  end

end
