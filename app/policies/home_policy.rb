class HomePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end


  def index?
    true
  end

  def show?
    true
  end

  def create?
    return true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end



# class RestaurantPolicy < ApplicationPolicy
#   class Scope < Scope
#     def resolve
#       scope.all

#       # For a multi-tenant SaaS app, you may want to use:
#       # scope.where(user: user)
#     end
#   end
# end
