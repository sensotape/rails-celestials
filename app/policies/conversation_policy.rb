class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    record.sender == user || record.recipient == user
  end

  def show
    record.sender == user || record.recipient == user
  end

  def create?
    record.interest.user == user
  end

  def destroy?
    record.user == user
  end
end
