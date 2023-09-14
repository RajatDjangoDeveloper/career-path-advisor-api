class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, [Education, Assesment]
    else
      can :read, [Education, Assesment]
      can :create, [Education, Assesment]
    end
  end
end