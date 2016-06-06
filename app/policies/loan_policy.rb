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
    !record.book.loaned? || record.book.user != user
  end
end
