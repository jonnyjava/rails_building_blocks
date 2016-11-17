class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{name} #{first_surname} #{second_surname}"
  end

  def self.translated_roles
    User.roles.map { |k, _v| [I18n.t(k), k] }
  end
end
