class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def show?
    true
  end

  def update?
    # restaurant.user == current_user
    is_owner?
    # true
  end

  def destroy?
    # record.user == user
    is_owner?
  end

  def create?
    # true
    # user = current_user
    !user.nil?
  end


  private

  def is_owner?
    record.user == user
  end

end
