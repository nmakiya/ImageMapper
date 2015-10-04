class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Image, Image.all do |i|
      i.user == user
    end  
  end
end
