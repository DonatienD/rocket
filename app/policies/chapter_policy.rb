class ChapterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    record.room.user == user
  end

  def create?
    new?
  end
end
