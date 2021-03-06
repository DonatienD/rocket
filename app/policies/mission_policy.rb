class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.user == user
  end

  def new?
    record.chapter.user == user
  end

  def create?
    new?
  end

  def play?
    room_id = record.chapter.room.id
    user.accesses.where(room_id: room_id).present?
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy?
    record.user == user
  end
end
