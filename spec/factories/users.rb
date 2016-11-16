FactoryGirl.define do
  factory :user do
    name                { Faker::Name.first_name }
    first_surname       { Faker::Name.last_name }
    second_surname      { Faker::Name.last_name }
    phone               { Faker::PhoneNumber.phone_number }
    email               { Faker::Internet.email }
    password            '12345678'
    use_of_cookies      true
    confirmed_at        { Faker::Date.between(2.days.ago, Date.today) }

    factory :admin, class: User do
      role 'admin'
    end
  end
end
