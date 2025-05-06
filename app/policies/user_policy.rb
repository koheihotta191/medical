class UserPolicy < ApplicationPolicy
  def index?
    user.admin? # 管理者のみ許可
  end

  def create?
    user.admin? # 管理者のみ許可
  end

  def new?
    create? # create?と同じ権限
  end

  def update?
    user.admin? # 管理者のみ許可
  end

  def destroy?
    user.admin? # 管理者のみ許可
  end
end