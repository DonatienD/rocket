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

  def destroy?
    # Three conditions to be able to delete an access (i.e. leave room) :
    # 1. Should be the user that created the access
    # 2. Should be a student
    # 3. Should be linked to a teacher room (i.e. a room not created by user)
    record.user == user && !user.teacher? && record.room.user != user
  end
end
