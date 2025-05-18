class UserPolicy < ApplicationPolicy
  def index?
    user.role == 0 # 管理者のみ許可
  end

  def create?
    user.role == 0 # 管理者のみ許可
  end

  def new?
    user.role == 0 # create?と同じ権限
  end

  def update?
    user.role == 0 # 管理者のみ許可
  end

  def destroy?
    user.role == 0 # 管理者のみ許可
  end
end