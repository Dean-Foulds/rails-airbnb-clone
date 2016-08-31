class HomePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def index?
    true
  end

  def new?
    return true
  end

  def create?
    return true
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
