class PatientPolicy < ApplicationPolicy
  def index?
    true # 全職種許可
  end

  def show?
    true # 全職種許可
  end

  def create?
    user.admin? || user.doctor? || user.nurse? # 管理者、医師、看護師が許可
  end

  def update?
    user.admin? || user.doctor? || user.nurse? # 管理者、医師、看護師が許可
  end

  def destroy?
    user.admin? # 管理者のみ許可
  end
end