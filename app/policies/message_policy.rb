class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.interest.user == user
  end

  def permitted_attributes
    [:body]
  end
end
