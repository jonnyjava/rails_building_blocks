require 'rails_helper'

class <%= class_name %>Policy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    false
  end

  def create?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end
end
