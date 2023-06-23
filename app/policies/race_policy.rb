class RacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def bookmark?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
