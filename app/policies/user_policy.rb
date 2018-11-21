class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record == user
  end

  def create?
    record == user
  end

  def update?
    record == user
  end

  def destroy?
    record == user
  end

  def permitted_attributes
    [:avatar, :first_name, :last_name, :bio]
  end
end
