class PostPolicy < ApplicationPolicy

  # Autobot: Read Scope

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "" unless user 
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.su?
        scope.where(user: user)
      else
        scope.all
      end
    end
  end

  # Autobot: Permitted Attributes



  # Autobot: Permitted Actions
def destroy?
                #return true if record.user_id == user.id
                user.admin?
              end
def update?
                #return true if record.user_id == user.id
                user.admin?
              end
 def show?
                  user.admin? || user.su?
                end
def create?
                #return true if record.user_id == user.id
                user.admin? || user.su?
              end


end
