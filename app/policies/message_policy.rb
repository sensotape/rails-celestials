class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.conversation.sender == user || record.conversation.recipient == user
  end

  def permitted_attributes
    [:body]
  end
end
