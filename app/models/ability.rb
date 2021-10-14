# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
  end
end
