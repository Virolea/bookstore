class LoanPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
  end

  def create?
    !record.book.loaned? && record.book.user == user
  end

  def update?
    record.status == "loaned" && record.user == user
  end
end
