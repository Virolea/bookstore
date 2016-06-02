class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def destroy?
    record.user == user
  end
end
