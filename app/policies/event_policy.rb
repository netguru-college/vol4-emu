class EventPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  def join?
    user.present? && !is_owner?
  end

  def leave?
    user.present? && !is_owner?
  end

  def show?
    true
  end

  private
  def is_owner?
    Participation.owner.where(event: record, user: user).any?
  end
end
