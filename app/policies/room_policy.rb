class RoomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.accesses.where(room_id: record.id).present?
  end

  def new?
    user.teacher?
  end

  def create?
    new?
  end

  def destroy?
    record.user == user
  end
end
