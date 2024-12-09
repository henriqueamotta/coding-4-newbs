class ForumPolicy < ApplicationPolicy
  
  def new?
    user.present? 
  end

  def create?
    user.present? 
  end


  class Scope < ApplicationPolicy::Scope

    def resolve
      scope.all
    end
    
  end
end
