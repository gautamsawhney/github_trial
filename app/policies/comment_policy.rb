class CommentPolicy < ApplicationPolicy

  # Autobot: Read Scope

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "" unless user 
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.where(user: user)
      else
        scope.all
      end
    end
  end

  # Autobot: Permitted Attributes
  def permitted_attributes
    #add_here
    if user.admin?
      [:text, :user_id, :post_id]
    elsif user.su?
      [:text, :user_id, :post_id]
    else
      []
    end
  end



  # Autobot: Permitted Actions
  def destroy?
    #return true if record.user_id == user.id
    user.admin? || user.su?
  end
  def update?
    #return true if record.user_id == user.id
    user.admin? || user.su?
  end
  def show?
    user.admin?
  end
  def create?
    #return true if record.user_id == user.id
    user.admin?
  end


end
