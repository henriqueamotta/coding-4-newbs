class ForumPolicy < ApplicationPolicy
  
  def new?
    user.present? 
  end

  def create?
    user.present?
  end

  def show?
    true
  end

  def destroy?
    user.present? && (user.admin? || record.user == user)
  end

  class Scope < ApplicationPolicy::Scope

    def resolve
      scope.all
    end

  end
end
