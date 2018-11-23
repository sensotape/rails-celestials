class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    # false
    true
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    # false
    true
  end

  def new?
    create?
  end

  def update?
    # false
    true
  end

  def edit?
    update?
  end

  def destroy?
    # false
    true
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
