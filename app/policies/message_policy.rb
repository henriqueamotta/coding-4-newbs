class MessagePolicy < ApplicationPolicy
    # Define quem pode excluir uma mensagem
    def destroy?
      user.present? && (user.admin? || record.user == user) 
      # Admins ou o autor da mensagem podem excluir
    end
  
    # Outros métodos de autorização podem ser adicionados aqui (se necessário)
  end
  