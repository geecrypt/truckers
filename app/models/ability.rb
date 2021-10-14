# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can %i[read reserve], Truck, company_id: user.company_id if user.role == 'driver'
    can %i[manage], Truck, company_id: user.company_id if user.role == 'admin'
  end
end
