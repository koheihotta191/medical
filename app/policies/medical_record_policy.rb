class MedicalRecordPolicy < ApplicationPolicy
  def index?
    user.doctor? # 医師のみ許可
  end

  def show?
    user.doctor? # 医師のみ許可
  end

  def create?
    user.doctor? # 医師のみ許可
  end

  def update?
    user.doctor? # 医師のみ許可
  end

  def destroy?
    user.admin? # 管理者のみ許可
  end
end