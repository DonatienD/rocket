class AccessPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    !user.teacher?
  end

  def create?
    new?
  end
end
