class <%= class_name %>Policy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
