class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # ログインしている場合のみ権限を設定

    if user.staff_id == "123456"
      can :manage, User # 職員登録機能へのアクセス権限を付与
      can :manage, Patient # 患者の新規登録や編集の権限
      can :manage, MedicalRecord # 診療記録の管理権限
    else
      can :manage, Patient # 患者の新規登録、編集、詳細の権限
      can :manage, MedicalRecord # 診療記録の管理権限
    end

    can :read, Patient # 全ユーザーが患者一覧を閲覧可能
  end
end
