class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{name} #{first_surname} #{second_surname}"
  end
end
