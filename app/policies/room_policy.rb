class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.teacher? && record.user == user
  end

  def new?
    user.teacher?
  end

  def create?
    new?
  end
end
