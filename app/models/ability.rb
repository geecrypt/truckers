# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    if user.role == 'driver'
      can :reserve, Truck, company_id: user.company_id
    end
  end
end
