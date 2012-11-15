class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? "admin"
      can :manage, :all
    else
      can :read, :all
    end
  end


  private
    def administration(user)
    end

    def provider(user)
    end

    def customer(user)
    end
end
