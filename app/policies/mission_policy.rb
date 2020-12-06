class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    room_id = record.chapter.room.id
    user.accesses.where(room_id: room_id).present? && record.user == user
  end

  def new?
    record.chapter.user == user
  end

  def create?
    new?
  end
end
